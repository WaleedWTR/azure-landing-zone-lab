targetScope = 'subscription'

param location string = 'uksouth'
param environment string = 'lab'
param owner string = 'waleed-rana'

resource platformRg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-platform-${environment}'
  location: location
  tags: {
    environment: environment
    owner: owner
    workload: 'platform'
  }
}

resource workloadRg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-workload-${environment}'
  location: location
  tags: {
    environment: environment
    owner: owner
    workload: 'portfolio'
  }
}

resource environmentTagPolicy 'Microsoft.Authorization/policyDefinitions@2023-04-01' = {
  name: 'require-environment-tag'
  properties: {
    displayName: 'Require environment tag on resource groups'
    description: 'Portfolio policy requiring an environment tag on resource groups.'
    policyType: 'Custom'
    mode: 'All'
    parameters: {}
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Resources/subscriptions/resourceGroups'
          }
          {
            field: 'tags[environment]'
            exists: 'false'
          }
        ]
      }
      then: {
        effect: 'deny'
      }
    }
  }
}

resource environmentTagAssignment 'Microsoft.Authorization/policyAssignments@2024-04-01' = {
  name: 'require-environment-tag'
  properties: {
    displayName: 'Require environment tag'
    policyDefinitionId: environmentTagPolicy.id
    enforcementMode: 'Default'
  }
}

output platformResourceGroup string = platformRg.name
output workloadResourceGroup string = workloadRg.name
output policyDefinitionId string = environmentTagPolicy.id
