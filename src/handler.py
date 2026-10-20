import json
import os
import uuid

import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def _response(status, body):
    return {
        "statusCode": status,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }


def handler(event, context):
    """Simple CRUD API backed by DynamoDB, fronted by API Gateway (HTTP API)."""
    method = event.get("requestContext", {}).get("http", {}).get("method")
    path_params = event.get("pathParameters") or {}
    item_id = path_params.get("id")

    try:
        if method == "GET" and item_id:
            result = table.get_item(Key={"id": item_id})
            item = result.get("Item")
            if not item:
                return _response(404, {"message": "Not found"})
            return _response(200, item)

        if method == "GET":
            result = table.scan(Limit=100)
            return _response(200, result.get("Items", []))

        if method == "POST":
            data = json.loads(event.get("body") or "{}")
            item = {"id": str(uuid.uuid4()), **data}
            table.put_item(Item=item)
            return _response(201, item)

        if method == "DELETE" and item_id:
            table.delete_item(Key={"id": item_id})
            return _response(204, {})

        return _response(400, {"message": "Unsupported route"})
    except Exception as exc:  # noqa: BLE001 - surface error to caller
        return _response(500, {"message": str(exc)})
