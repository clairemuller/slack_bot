# Slack Bot Challenge

[design doc](https://docs.google.com/document/d/1RzONrzadTjaG7FcdniHlznlAbxoFhIieIu7GxrHhjtM/edit)

This app allows a Slack user to create GitHub issues using the slash command **/issue** followed by the issue's text.

### To run the bot yourself

Fork and clone the repo, and run `bundle install`. Then create a Slack app [here](https://api.slack.com/apps), assigning it to your workspace.

Save your new Slack app's client id and client secret to a `.env` file using the variables `CLIENT_ID` and `CLIENT_SECRET`, then add your GitHub username and password using the `GITHUB_USERNAME` and `GITHUB_PASSWORD` variables.

For the purposes of testing, you can use [ngrok](https://dashboard.ngrok.com/get-started) to expose your local webserver:
* Start your local server with the `shotgun` command.
* Configure ngrok to point to your local server's port: `./ngrok http 9393`
* ngrok will give you a forwarding url, e.g.: `http://1c4e8b5a.ngrok.io`

Add a slash command, `/issue` to your Slack app, setting the request URL to the url provided by ngrok.
Keep in mind that any time you restart ngrok, you will get a different url.

Install the app to your workspace and you're ready to go!
