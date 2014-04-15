SITE_NAME="java-tomcat-test1"

azure site create --location "West Europe" $SITE_NAME

azure site appsetting add TEAMCITY_DATA_PATH="D:\home\site\wwwroot\webapps\BuildServer" $SITE_NAME