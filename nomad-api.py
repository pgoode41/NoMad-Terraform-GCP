import sys
import os
import requests
import json
from pprint import pprint


#url = "http://35.226.154.187:4646"
url = "http://nomad-server-node.stratushook.io:4646"
members_Endpoint = "/v1/agent/members"
servers_Endpoint = "/v1/agent/servers"
nodes_Endpoint = "/v1/nodes"

response = requests.get(url+members_Endpoint, params=None)

pprint(response.json())