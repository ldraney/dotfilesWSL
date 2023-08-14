fast:
- Make sure branch is updated with latest master (just a gq 'latest' should work)
wd branch
gq 'latest'


- Open PR with cli (for future automation)
pr_view qa docker-password

- Move ticket to dev testing lane via CLI (future automation)
```
ZH_TOKEN=
PIPELINE_ID=
TICKET_NUMBER=

curl -X POST -H "Content-Type: application/json" -H "X-Authentication-Token: $ZH_TOKEN" -d '{"pipeline_id": "$PIPELINE_ID", "position": "top"}' "https://api.zenhub.com/p1/repositories/REPOSITORY_ID/issues/$TICKET_NUMBER/moves"
```








pick up ticket
understand/research ticket (can include testing elsewhere)
talk to QA - we get on the same page
do whatever work you need to do
if we didn't talk earlier, we absolutely need to talk before you open that PR, draft is fine
Normally deploy branch to dev and test your branch, can't do that here > Dev Testing
When satisfied that thing works on dev (can't do that here), open the PR > Dev Testing
make sure my branch is updated


# Opening a PR
- QA label - When I open a PR, the ticket should be moved to the DEV-testing lane.
- When requesting reviews, be sure to put the PR symbol on the request in Engineers chat!
- Make sure branch is updated with latest master

# Merging a PR
- before merging, run the regression suite against what I have deployed in dev!
- after merging, be sure to send a message to Slack chat saying it's been merged, and to update the branches.  include the PR emoji! 
- QA label - move the ticket to QA lane
