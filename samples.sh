#
# samples
# jmu, nov 2020
# jmu, updated feb 2021
#
compartmentId="<your compartment ocid here>"
namespaceName="<your storage namespace here>"
#
#
#
# get os namespace name
./oci-rest objectstorage.eu-frankfurt-1.oraclecloud.com get "/n/"

# get usages
# put json body in a file called jsonbody.json, example
# {
#	"granularity": "HOURLY",
#	"tenantId": "ocid1.tenancy.oc1..aaaaaa...............",
#	"timeUsageStarted": "2021-02-10T00:00:00.000Z",
#	"timeUsageEnded": "2021-02-11T00:00:00.000Z"
# }
#
./oci-rest usageapi.eu-frankfurt-1.oci.oraclecloud.com post jsonbody.json "/20200107/usage" 
#
#
# get os buckets
./oci-rest identity.eu-frankfurt-1.oraclecloud.com get "/20160918/compartments/?compartmentId=$compartmentId"
#
# get buckets
./oci-rest objectstorage.eu-frankfurt-1.oraclecloud.com get "/n/$namespaceName/b/?compartmentId=$compartmentId&limit=1"
#
# get vnc's
./oci-rest iaas.eu-frankfurt-1.oraclecloud.com get "/20160918/vcns/?compartmentId=$compartmentId&limit=1"
#
# get instances
./oci-rest iaas.eu-frankfurt-1.oraclecloud.com get "/20160918/instances/?compartmentId=$compartmentId&limit=1"
#
# get exadata infras
./oci-rest iaas.eu-frankfurt-1.oraclecloud.com get "/20160918/exadataInfrastructures/?compartmentId=$compartmentId"
#
# get vmClusters
./oci-rest database.eu-frankfurt-1.oraclecloud.com get "/20160918/vmClusters/?compartmentId=$compartmentId"
#
#