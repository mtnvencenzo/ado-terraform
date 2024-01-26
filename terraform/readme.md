# Setup Terraform Repo
To terraform azure devops we are using the standard administration storage account in the Azure cloud using it's own container and tfstate.

### Step 1 (create the azure devops organization and ado terraform project/repo)
Manually create the `ADO Terraform` project and repo which will be used to store the terraform files that will generate the rest of the devops setup.

### Step 2 (create a service connection to authenticate to the azure cloud)
A service connection is needed to allow ado to store it's terraform state in an azure storage account.
``` text
name		= sc-vec-eus-terraform-ado-001
type		= Azure Resource Manager
auth		= WorkloadIdentityFederation
subscription	= sub-vecchi-001
```

### Step 3 (setup the storage container to store the .tfstate for ado)
This storage account might already exist, if it does then just create the container and grant the priviledges listed below.
``` text
resource group	= rg-vec-eus-administration-001
storage account	= stveceusterraformstat001
container	= terraform-ado
```
## TODO
Grant the service connection created in step 2 to the storage account with `Owner` (unconditioned) priviledges.
Grant the service connection created in step 2 to the container with `Storage Blob Data Owner` priviledges.

### Step 4 (create a PAT token will full access to the organization)
Create a Personal Access Token with `Full Access` to the organization and name it `Terraform`. This will later be stored as a secret on the pipeline that runs the terraform and will be used to allow terraform to create ado resources.

### Step 5 (create the terraform pipeline)
Make sure the repo has all the terraform and pipeline files pushed to it and create a pipeline using the `$/terraform-azure-pipelines.yml`.  Create a secret named `terraform_pat` and give it the value of the PAT created in the previous step.

### Step 6 (run the pipeline!)

### Step 8'ish (delete default git repos)
The first time a project is setup a default git repo is created using the name of the project.  There's no way to stop this so they should be manually deleted.