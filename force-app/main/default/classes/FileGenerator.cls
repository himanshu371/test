public class FileGenerator {
    //this generater is no use for me but helpful at that time 
    public FileGenerator()
    { 
       String csv = 'Id,Name\n';
     for ( List<Profile> accts : [ SELECT id,
                                  Name,
                                  PermissionsAssignPermissionSets,
                                  PermissionsCustomizeApplication,
                                  PermissionsManageInternalUsers,
                                  PermissionsManageRoles,
                                  PermissionsManageSessionPermissionSets,
                                  PermissionsManageIpAddresses,
                                  PermissionsManageLoginAccessPolicies,
                                  PermissionsAllowLightningLogin,
                                  PermissionsManageProfilesPermissionsets,
                                  PermissionsManageSharing,
                                  PermissionsManageUsers
                                  FROM Profile 
                                  Where PermissionsAssignPermissionSets = true  or 
                                  PermissionsCustomizeApplication = true or 
                                  PermissionsManageInternalUsers = true or
                                  PermissionsManageRoles =true or
                                  PermissionsManageSessionPermissionSets =true or
                                  PermissionsManageIpAddresses = true or 
                                  PermissionsManageLoginAccessPolicies = true or
                                  PermissionsAllowLightningLogin = true or
                                  PermissionsManageProfilesPermissionsets = true or
                                  PermissionsManageSharing = true or
                                  PermissionsManageUsers = true ] ) {
                                      for ( Profile acct : accts ) {
                                          csv += acct.id + ',' + acct.name.escapeCsv() + '\n';
                                      }
                                  }
     
     ContentVersion file = new ContentVersion(
         title = 'profile.csv',
         versionData = Blob.valueOf( csv ),
         pathOnClient = '/profile.csv'
     );
     
     insert file;
     //System.debug( file );
     
    }
}