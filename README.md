# sample-flask-app
I will be using this sample flask app to deploy on EC2 instances, AWS Code pipeline( code build and code deploy), later i will deploy on eks cluster in AWS...

# Continous Integration Steps..

Uploaded code along with Dockerfile in the repository, then created code build project from AWS and authenticated with the Source as Githhub.
Inorder to use code build service it needs to have a file called buildspec.yml (Same as like Jenkins declarative pipleline steps..)
So, added bulildspec.yml in the repository and checkein.. Later created CodePipeline project which is used to automate the Continous 
integration flow, so every time code checks in GitHub code pipeline gets triggered and it internally triggers the codebuild and performs the build operation, once build completed we can send Notifications via email,

# Continous Delivery Steps...

Now we will improve code pipeline to add one more step called as deploy, and willl be deploying to code-deploy service in AWS.
And code-deploy will internally deploys the applications on to EC2 instances (Note, code deploy and ec2 should communicate each other for this
IAM role is required also on ec2 instances, code-deploy agent should be running.. ).
