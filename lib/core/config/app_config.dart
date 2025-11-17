class AuthConfig {
  static const clientId = "2a82f3fd-d4e5-44c7-a0fb-d2a95c9b9e00";
  static const tenantId = "37dba681-e7d8-4c84-a5f9-9c0ad7ebf719";

  // Ten RID musi być taki jak w Azure!
  static const redirectUri =
      "msauth://workai.pl.test_plan_manager_app/sFvfVHx91Oto6P3W425COiNd8v4=";

  static const scopes = [
    "openid",
    "profile",
    "email",
    "offline_access",
    "User.Read",
    "Sites.Read.All",
    "Sites.ReadWrite.All",
  ];
}
