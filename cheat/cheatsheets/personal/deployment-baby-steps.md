## Congratulations!  You are in charge of the next deployment for this sprint!  

### First steps:
* start an open channel of communication with QA to be aware of anything that may prevent deployment
* create a ticket for deployment using the template (found in this repo)
* click the appropriate checkboxes on your ticket throughout this process.  You won't need to start checking boxes 
* add planned Deployment to team Calendar
	+ 7:00 PM EST is the standard time to deploy unless you are otherwise notified
* ping @Nathan Wright on Slack to ask who will be available on Strike for the deployment on the planned date  (we have a regular deploy every two weeks, we just need strike to have someone on standby
* it's good to know that on day of deployment, vanotify-infra repo will be deployed before notifications-api, and a lot of this deployment process follows that pattern.
* Move deployment ticket to "in progress"

### Pre Deployment checklist on your ticket
* Get started on this ticket Tuesday after QA says the tag is ready in notification-api
* in the va-notifications-va-gov-program channel on slack, post an announcement like:

	:spicyllamas:    HEADS UP:   We will be deploying to Production at 7:00 PM EST with the updates from our latest sprint.

	* then, verify that Strike has someone on call using the [on-call](https://docs.google.com/spreadsheets/d/1xWzSqRzYpQmQzQGeTud2HCOICHK_EiQc0lGvnHznsZI/edit?usp=sharing ) sheet.  Then in the comments of the channel, ping Strike to confirm that the on-call person for Strike will be available.
	* It is also a good idea to post a Zoom link for the deploy for anyone on the team who wants to observe.

* Add a similar announcement to the DSVA va-notify-public channel:

	:llama: Deployment Notice :llama:
	We will be deploying Infra and API at 7pm Eastern tonight.
	No downtime is expected.


* check if a tag has already been cut for the latest master of vanotify-infra:

	```
	wd infra
	git checkout master
	git pull
	gh release list
	```
Output is like this (don't worry about the pre-release): 
![image](https://user-images.githubusercontent.com/107153866/214868862-09ec5ced-913f-433e-80c9-d31fa1ed2b5c.png)
Check that the SHA of the tag is the same as the latest commit to master.

otherwise you will likely need to cut a tag yourself.  
	* typical tag name will be a minor version unless you were already otherwise notified
```
git tag vx.x.x
git push --tags
```
* Do the same thing for the notifications-api repo

### Set up the pre-release for infra and notifications-api
* Don't be hasty as you perform the upcoming steps
* Set up the pre-release for infra and staging and send them to staging with enough time to be able to smoke test staging. 
    * To do this for infra, go to this url and click “Draft a new release”
    * for tag version, click the tag you created
    * **MAKE SURE you click “Set as a pre-release”
    * For the name of the release, follow a format like “v1.5.4 - 24 JAN 2022”
    * click on “Generate Release notes”, which are likely sufficient. 
        * double check that the labels on the Pull Requests match the tickets involved, because this will affect the "Exciting New Features" generation of the Release notes
    * click “publish release”
* Do the same for notifications-api

At this point, you should be here with your deploy ticket: \
![image](https://user-images.githubusercontent.com/107153866/214872782-c6a0f503-7d4c-433d-b38f-edead6015329.png)

## Checking SMS, Email, and UI functionality are working in staging and perf
* These steps are important, as you will be performing them for production to verify successful deployment
* For staging and production, you will need to use Postman to send an sms and then an email message after each deploy.
* If you have not yet set up Postman, see the postman-configuration-guide.md in this directory

### SMS
* in Postman, make sure you are in the appropriate environment, go to Collections and POST send sms with phone_number
* GET get notification and make sure status is "delivered"

### EMAIL
* in Postman, make sure you are in the appropriate environment, go to Collections and POST send email with email_address
* GET get notification and make sure status is "delivered"

### UI
* log into the Portal (through CAG or GFE) and create a template (either email or sms) and then edit that template.
	+  https://staging.notifications.va.gov
	+  https://perf.notifications.va.gov
	+  At both of these URLS, * these are both check off by going to the environments url (CAG) (e.g. [https://staging-notifications.va.gov/](https://staging-notifications.va.gov/)) and go to services -> VA NOTIFY -> any template -> edit)
    * Once you are in the editing screen, you have successfully tested this; but go ahead and play some more if you are so inclined. 

### Monitoring for failures
* After your deploy to staging and perf, it is good to identify potentially negligible or significant errors.  We currently look for these errors in the cloudwatch logs, but we will soon have a Datadog or another way to quickly filter out common errors or anamolies
    * Five most common queries for cloudwatch logs: “fail” “Error” “warning"
    * Refresh those searches regularly
* It would be good to go over these errors with tech lead, so you have no surprises on deployment
* Some things to look for in the logs:
    * look for anything that’s not a startup error
    * look for validation errors
    * key type errors

## At this point, you have successfully completed your Staging deploy checklist!  Good work!




--- below this line still being edited/written ---

## Deploying to Production 
* Again, deployment should start at 7:00 PM EST or according to your planned schedule
* infra usually deploys pretty fast (a few minutes or less), notifications-api 15-20 minutes


* Open Datadog and keep an eye on the response times and any unexpected dips
    * Note: If PUSH notifications are present, response times may average up to 3 seconds....
* Complete the deploy ticket checklist items
* Final check across Datadog and the cloudwatch logs
* If anything goes off the rails roll it back
* Go 

IN CASE YOU NEED TO ROLLBACK because of unexpected errors or functionality: \


<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")


final step: \
update your announcements in the appropriate channels that the deployment is finished and was successful

**some useful notes**



* understanding ecs
    * Jacob put it well - “Cluster has one or more Services.  A Service has one task defintion.  A Service has one or more tasks. A Task has one or more containers.”
    * Task definitions are basically just environment variables for the service (which includes which containers run in that task)
    * a service may have one or more tasks
    *
