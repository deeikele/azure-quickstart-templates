// Creates an Azure AI resource with proxied endpoints for the Azure AI services provider
@description('Azure region of the deployment')
param location string

@description('Tags to add to the resources')
param tags object

@description('AI project name')
param aiProjectName string

@description('AI project display name')
param aiProjectFriendlyName string = aiProjectName

@description('AI project description')
param aiProjectDescription string

@description('AI hub resource id')
param aiHubResourceId string

resource aiProject 'Microsoft.MachineLearningServices/workspaces@2023-08-01-preview' = {
  name: aiProjectName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    // organization
    friendlyName: aiProjectFriendlyName
    description: aiProjectDescription
    hubResourceId: aiHubResourceId

    systemDatastoresAuthMode: 'identity'
  }
  kind: 'project'
}

output aiProjectID string = aiProject.id
