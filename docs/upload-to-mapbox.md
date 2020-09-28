# Uploading Data to Mapbox

We will be using the [Mapbox Uploads API](https://docs.mapbox.com/api/maps/#uploads) to upload our dataset to Mapbox Studio.

Our data will be in either csv or geojson when uploaded. The only advantage of geojson I've found so far is that you can use integers instead of strings, where csv's all will be converted to strings.

There are four steps to this process.
1. Retrieve S3 Credentials to stage the file
2. Use an S3 Client to upload the file to the staging bucket
3. Create an upload using the staged file's URL.
4. Retrieve the upload's status to confirm success.

## 1. Retrieve S3 Credentials to stage the file
Need HTTP Client, looking at:
* [httparty](https://github.com/jnunemaker/httparty) - friendly syntax
* [Typhoeus](https://github.com/typhoeus/typhoeus) - my default recently
* [Faraday](https://github.com/lostisland/faraday) - popular, nice [docs](https://lostisland.github.io/faraday/usage/) 
#### Request
```
POST /uploads/v1/{username}/credentials
# ie
POST "https://api.mapbox.com/uploads/v1/{username}/credentials?access_token=YOUR MAPBOX ACCESS TOKEN
This endpoint requires a token with uploads:write scope.
```
#### Response
```
{
  "accessKeyId": "{accessKeyId}",
  "bucket": "{bucket}",
  "key": "{key}",
  "secretAccessKey": "{secretAccessKey}",
  "sessionToken": "{sessionToken}",
  "url": "{url}"
}
```
Note: this bucked is in `us-east-1`

At this point the docs recommend exporting them to the ENV, but I wonder if they change. And if so, how often.

## 2. Use and S3 Client to upload the file to the staging bucket
Will probably use the AWS S3 gem for this, but I don't yet know how that deals with holding on to different credentials.
Another potential gem would be [Shrine](https://github.com/shrinerb/shrine).

## 3. Create an upload using the staged file's URL.
#### Request
_After you have uploaded..._
```
POST /uploads/v1/{username}
{
  url: "S3 Object or dataset ID"
  name: "optional"
  private: tileset need token?
}
```
#### Response
_Using a tileset example_
```
{
  "complete": false,
  "tileset": "{username}.{tileset-name}",
  "error": null,
  "id": "{upload-id}",
  "name": "{username}-{tileset-name}",
  "modified": "{timestamp}",
  "created": "{timestamp}",
  "owner": "{username}",
  "progress": 0
}
```
## 4. Retrieve the upload's status to confirm success.
#### Request
```
GET "https://api.mapbox.com/uploads/v1/{username}/{upload_id}?access_token=YOUR MAPBOX ACCESS TOKEN
```
#### Response
```
{
  "complete": true,
  "tileset": "example.markers",
  "error": null,
  "id": "hij456",
  "name": "example-markers",
  "modified": "{timestamp}",
  "created": "{timestamp}",
  "owner": "{username}",
  "progress": 1
}
```
