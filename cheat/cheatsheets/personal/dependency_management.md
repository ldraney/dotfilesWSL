# Dependency Management
We are looking into tools to assist with dependency managmenet. 

- [PDM](https://pdm.fming.dev/latest/) - Python package and dependency manager supporting the latest PEP standards that uses methods similar to npm.
- [pipenv](https://github.com/pypa/pipenv) - Pipenv is a tool that aims to bring the best of all packaging worlds (bundler, composer, npm, cargo, yarn, etc.) to the Python world. Pipenv uses the upcoming Pipfile and Pipfile.lock, a similar concept to what npm does.
- [Poetry](https://python-poetry.org/) - Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs. Poetry comes with an exhaustive dependency resolver, which will always find a solution if it exists. 

## PDM
[Task](https://app.zenhub.com/workspaces/va-notify-620d21369d810a00146ed9c8/issues/department-of-veterans-affairs/notification-api/912)

### Setup
Address how simple/difficult the setup is.

### Documentation
Describe the documentation

### Tests
Details about how the dependency manager handled each of the following tests.
#### Flask Import Error Test
#### Celery Dependencies
#### Security Vulnerability Check
#### Updating Pinned Versions
#### Specific Version Commit Test
#### Specific Version Tag Test

## pipenv
[Task](https://app.zenhub.com/workspaces/va-notify-620d21369d810a00146ed9c8/issues/department-of-veterans-affairs/notification-api/911)

### Setup
Setups can be buggy since pipenv is managed by a pip itself, which the user manages outside of pipenv.
Address how simple/difficult the setup is.

### Documentation
Describe the documentation

### Tests
Details about how the dependency manager handled each of the following tests.
#### Flask Import Error Test
#### Celery Dependencies
#### Security Vulnerability Check
#### Updating Pinned Versions
#### Specific Version Commit Test
#### Specific Version Tag Test

## Poetry
[Task](https://app.zenhub.com/workspaces/va-notify-620d21369d810a00146ed9c8/issues/department-of-veterans-affairs/notification-api/913)

### Setup
[Installation script](https://python-poetry.org/docs/):
```
curl -sSL https://install.python-poetry.org | python3 -
```
For a new Project
```
cd [project directory]
poetry init
poetry install
```
## Starting a freshly cloned repo from github
poetry automatically creates and uses it's own virtual environment (based on the pyproject.toml) with the following command:
```
poetry run python [file-name.py]
```
#### Point to consider
- The poetry shell command is notoriously [buggy](https://stackoverflow.com/questions/60580332/poetry-virtual-environment-already-activated), so the poetry run python command is the easiest way to get started.  If you don't want to run in a subshell, [that is also an option](https://python-poetry.org/docs/basic-usage/#activating-the-virtual-environment), but having this start when cd-ing into the directory either requires a custom script or third-party plugin.
- it's easy to set up [autocomplete](https://github.com/department-of-veterans-affairs/vanotify-team/blob/master/Engineering/dependency_management.md#poetry) for bash or zsh
- compatible with pyenv
- [synchronizing dependencies](https://python-poetry.org/docs/managing-dependencies/#synchronizing-dependencies) is a powerful feature, as it ensures that your environment only consists of what is in the poetry.lock.  Also, this may also be a useful devops feature when combined for groups. 
- Can easily build and publish packages
- Can easily convert to requirements.txt  `poetry export -f requirements.txt`

### Documentation
Documentation is seems easy to follow, useful, and complete, but did take a little effort to understand poetries strengths.  Strengths and weaknesses are outlined below

### Dependency Management Procedure
The key to understand poetry is the relationship of [it's commands](https://python-poetry.org/docs/cli) with pyproject.toml and poetry.lock.  In short, you should never edit poetry.lock.  `poetry install` uses the poetry.lock, or creates one if it doesn't exist; it creates it based off of pyproject.toml.  Pyproject.toml can be edited directly, though it's easiest to just use `poetry add` (see below)

After directly editing pyproject.toml, one would run `poetry lock` and `poetry install` to update the lockfile and environment.  

[Poetry Dependency Management Documentation](https://python-poetry.org/docs/dependency-specification/)
After a project is initialized with `poetry init`, you may need to add or update depdendencies. 
To add a new dependency, one of the following will add to the pyproject.toml and install to the environment: 
```
poetry add [dependency]   #adds latest version
poetry add [dependency]@latest  #adds latest version
poetry add "[dependency]==1.8.0"  #pins at a specific version
poetry add [dependency]@^4.0.0  #any version above 4
```
updating dependencies is automatically handled with various forms of the `poetry add`:
[poetry add](https://python-poetry.org/docs/cli/#add)
[Dependency Specification Syntax](https://python-poetry.org/docs/dependency-specification/#using-the--operator)

### Tests
#### Flask Import Error Test
```
poetry add fido2@^1.0.0
```
#### Celery Dependencies
```
poetry add kombu@^5.0
```
#### Security Vulnerability Check
The obvious first step here is to check as to why the latest version of a dependency is using a package with a security vulnerability.  I don't see the relevance to poetry or regular dependency management in general.  
#### Updating Pinned Versions
pyproject.toml has a useful and intuitive syntax for pinning versions, and offers a digestible file structure for documentation that can basically be copied and pasted after the first `poetry init`. However, editing the file directly is usually not necessary, since `poetry add [dependency]` will automatically update the dependency you indicate.
[pyproject.toml](https://python-poetry.org/docs/pyproject/)
[Dependency Specification](https://python-poetry.org/docs/dependency-specification/)

#### Specific Version Commit Test

You would have to directly edit the pyproject.toml to [source dependencies from an alternate repository](https://python-poetry.org/docs/dependency-specification/#source-dependencies)

#### Specific Version Tag Test
Same as specifying a specific commit.
Also, I think this issue is similar to the Security Vulnerability Check, in that this is more about the dependency than the dependency management tool. 

# Team decision
TBD

# Possible tests
Below are some potential dependencies that can be checked.

## Tech Stack-Specific
The following are related to our specific tech stack.
### Flask Import Error Test
```
Required: fido2 < 1.0.0
Installed: 0.9.3

Flask raises ImportError with higher versions.  I expect that newer versions of Flask fix this or don't require Fido.
```

### Celery Dependencies
```
Required: kombu < 5.0
Installed: 4.6.11

Celery depends on this package, and the Docker image build failed with the newest version.  Ignoring security vulnerability 42497 in Makefile.  The vulnerability is fixed in kombu>=5.2.1.
```

## Security Vulnerability Check
How does each handle security vulnerabilities?
```
Required: click-datetime>=0.2
Installed: 0.2 (newest version)

This package requires click, which has a security vulnerability 47833 ignored in Makefile.  The vulnerability is fixed in click>=8.0.

Installed: click v7.1.2
```

## Updating Pinned Versions
What, if anything does it do with pinned versions? If a pin is removed how does it handle it?
```
Required:
Flask < 2.0
Flask-Bcrypt==0.7.1
Flask-Cors==3.0.10
Flask-JWT-Extended==4.1.0
flask-marshmallow==0.11.0
Flask-Migrate==2.5.2

Installed Flask: 1.1.4

Newer versions of Flask cause errors, and all of the Flask-* packages are pinned to accommodate this.
```

## Specific Version Commit Test
Specific commit test. How does it handle it?
```
Required and installed: git+https://github.com/mitsuhiko/flask-sqlalchemy.git@500e732dd1b975a56ab06a46bd1a20a21e682262#egg=Flask-SQLAlchemy==2.3.2.dev20190108

Requiring Flask-SQLAlchemy version 2.3.2, 2.5, or 3.0 causes test failures via database errors about foreign key constraint violations.
```

## Specific Version Tag Test
```
Required: PyPDF2 < 2.0.0
Installed: 1.28.6

Required and installed: git+https://github.com/department-of-veterans-affairs/notification-utils.git@1.0.67#egg=notification-utils==1.0.67

Flask raises ImportError with newer versions of PyPDF2.  notification-utils version 1.0.66 also raises import errors with newer versions, but that package can be updated to version 1.1.0 if we upgrade Flask.
```

