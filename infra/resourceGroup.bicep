targetScope = 'subscription'

@description('Name of the resource group.')
param name string

@description('Location of the resource group. Resource groups could have different location than resources, however by default we use API versions from latest hybrid profile which support all locations for resource types we support.')
param location string

param stage string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: name
  location: location
  tags: stage != null ? { environment: stage } : {}
}

output resourceGroupName string = resourceGroup.name
