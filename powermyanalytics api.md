openapi: 3.0.0
servers:
  - description: Main PMA Server
    url: https://us-central1-power-my-analytics.cloudfunctions.net/
info:
  version: "1.0.1"
  title: Power My Analytics Hub API Documentation
  description:  |
    This is the API documentation for PMA's backend.
    # Usage
    - You can find your API Key under [Integrations -> API](https://hub.powermyanalytics.com/organizations?orgRoute=integrations/api).
    - To use the API with unknown users, you can replicate the OAuth2 User Grant application in Swagger.
    - To use the API in swagger, please click **"Authorize"** (no `client_id` / `client_secret` required).

security:
  - accessCode:
      - read
      - write
paths:
  /http-providers:
    get:
      summary: List Available 3rd Party Data Sources (Facebook, Microsoft, Google...)
      description: >-
        Before getting data by any data-connector, we need the user to authenticate with a given data-source. Every data-source has it's title, colors, logo, and authentication type, as well as a list of available connectors using that data source.
      tags:
        - Lists
      security: []
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                {
                  "type": "facebook",
                  "title": "Facebook & Instagram",
                  "color": {
                    "base": "#3b5998",
                    "contrast": "white"
                  },
                  "logoName": "facebook_instagram/facebook_instagram",
                  "oAuthType": "USER_GRANT",
                  "connectors": [
                    "facebook_ads",
                    "facebook_pages",
                    "facebook_instagram_ads",
                    "facebook_instagram"
                  ]
                },
                ...
              ]
  /http-connectors:
    get:
      summary: List Available 3rd Party Data Connectors (Facebook Ads, Facebook Pages, Microsoft Ads...)
      description: >-
        To use any connector you must know its id. This endpoint lists all of the available connectors.
        It also includes the color of the connector, as well as the Google Data Studio Link
      tags:
        - Lists
      security: []
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                  {
                    "type": "facebook_ads",
                    "provider": "facebook",
                    "title": "Facebook Ads",
                    "color": {
                      "base": "#3b5998",
                      "contrast": "white"
                    },
                    "logoName": "facebook/facebook",
                    "integrations": {
                      "dataStudio": "https://datastudio.google.com/u/0/datasources/create?connectorId=AKfycbxGg02Gvr4mgqIEGf1sa2eyflhgVSZ_yBvfTqJ0udF7C_oKsrrxBUc",
                      "googleAnalytics": true,
                      "googleSheets": true
                    }
                  },
                ...
              ]
  /http-organizations:
    get:
      summary: List Organizations the User is a Member of
      description: >-
        Every user can be a member of multiple organizations. This endpoint lists all of the organizations the user is a member of.
      tags:
        - Organization
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                {
                  "name": "Sample Organization Name",
                  "id": "123abc"
                },
                ...
              ]
        '401': 
          $ref: '#/components/responses/UnauthorizedError'
  /http-organizations/{organizationId}/accounts/:
    get:
      summary: List Organization's Accounts of all Providers
      parameters:
        - in: path
          name: organizationId
          schema:
            type: string
          required: true
          description: Organization ID the user is a member of

      description: >-
        Get all of the accounts for an organization
      tags:
        - Organization
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                {
                  "displayName": "Sample Account Name",
                  "id": "123abc",
                  "email": "sample@gmail.com",
                  "isTokenValid": true,
                  "timezone": "America/Los_Angeles"
                },
                ...
              ]
        '401': 
          $ref: '#/components/responses/UnauthorizedError'
        '404': 
          $ref: '#/components/responses/NotFoundError'
          
  /http-organizations/{organizationId}/accounts/{providerType}:
    get:
      summary: List Organization's Accounts of a Provider
      parameters:
        - in: path
          name: organizationId
          schema:
            type: string
          required: true
          description: Organization ID the user is a member of
        - in: path
          name: providerType
          schema:
            type: string
          required: true
          description: Provider's type
      description: >-
        Get all of the accounts of a given type for an organization
      tags:
        - Organization
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                {
                  "displayName": "Sample Account Name",
                  "id": "123abc",
                  "email": "sample@gmail.com",
                  "isTokenValid": true,
                  "timezone": "America/Los_Angeles"
                },
                ...
              ]
        '401': 
          $ref: '#/components/responses/UnauthorizedError'
        '404': 
          $ref: '#/components/responses/NotFoundError'
              
  /connectors-{connectorType}-config:
    get:
      summary: List Organization's Accounts of a Provider
      parameters:
        - $ref: '#/components/parameters/connectorType'
        - $ref: '#/components/parameters/organizationId'
        - $ref: '#/components/parameters/accountId'
      description: >-
        List of Config Fields for a Connector, Given Account in an Organization
      tags:
        - Connector
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                  {
                    "type": "SELECT_SINGLE",
                    "name": "account",
                    "displayName": "Ads Account",
                    "helpText": "Select the account you want to report on",
                    "options": [
                      {
                        "label": "Some account name",
                        "value": "some_string_value"
                      },
                      ...
                    ]
                  },
                  ...
                ]
        '401': 
          $ref: '#/components/responses/UnauthorizedError'
        '404': 
          $ref: '#/components/responses/NotFoundError'
          
              
  /connectors-{connectorType}-schema:
    get:
      summary: List of Schema Fields for a Connector
      parameters:
        - $ref: '#/components/parameters/connectorType'
        - $ref: '#/components/parameters/organizationId'
        - $ref: '#/components/parameters/accountId'
        - $ref: '#/components/parameters/config'
      description: >-
        List of Config Fields for a Connector, Given Account in an Organization
      tags:
        - Connector
      responses:
        '200':
          description: OK
          content:
            application/json:
              example: [
                  {
                    "name": "creative_id",
                    "tables": [
                      "ads",
                      "creatives",
                      "insights_placement"
                    ],
                    "column": "`creative_id`",
                    "label": "Ad Creative ID (ads, creatives, insights_placement)",
                    "description": "Unique identifier for a creative",
                    "dataType": "STRING",
                    "semantics": {
                      "conceptType": "DIMENSION",
                      "semanticType": "TEXT"
                    },
                  },
                  ...
                ]
        '401': 
          $ref: '#/components/responses/UnauthorizedError'
        '404': 
          $ref: '#/components/responses/NotFoundError'
          
                
  /connectors-{connectorType}-report:
    get:
      summary: Get report data for a connector
      parameters:
        - $ref: '#/components/parameters/connectorType'
        - $ref: '#/components/parameters/organizationId'
        - $ref: '#/components/parameters/accountId'
        - $ref: '#/components/parameters/config'
        - in: query
          name: start
          schema:
            type: string
            default: '2020-03-01'
          required: true
          description: Start date for the requested data
        - in: query
          name: end
          schema:
            type: string
            default: '2020-03-03'
          required: true
          description: End date for the requested data
        - in: query
          name: fields
          schema:
            type: string
            default: 'date,impressions'
          required: true
          description: Comma separated list of fields to get in the data
        - in: query
          name: aggregate
          schema:
            type: string
            default: ''
          required: true
          description: When this field is included, data is aggregated for formula fields, and for every unique set of dimensions. Otherwise, raw data is returned.
      description: >-
        List of Config Fields for a Connector, Given Account in an Organization
      tags:
        - Connector
      responses:
        '200':
          description: OK
        '401': 
          $ref: '#/components/responses/UnauthorizedError'
        '404': 
          $ref: '#/components/responses/NotFoundError'

components:
  schemas: {}
  parameters:
    connectorType:
      in: path
      name: connectorType
      schema:
        type: string
      required: true
      description: What connector do you want to get config for? (use dashes instead of underscores)
    organizationId:
      in: query
      name: organizationId
      schema:
        type: string
      required: true
      description: Organization ID the user is a member of
    accountId:
      in: query
      name: accountId
      schema:
        type: string
      required: true
      description: Provider Account Id
    config:
        in: query
        name: config
        schema:
          type: string
          default: '{"account": "some_string_value"}'
        required: true
        description: JSON stringify of the selected config from the config step
  responses:
    UnauthorizedError:
      description: Access token is missing or invalid
    NotFoundError:
      description: Organization Not Found
      content:
        application/json:
          example: {
            "entity": "organization"
          }
  securitySchemes:
    accessCode:
      type: oauth2
      flows:
        authorizationCode:
          authorizationUrl: 'https://hub.powermyanalytics.com/organizations/'
          tokenUrl: 'https://us-central1-power-my-analytics.cloudfunctions.net/http-thirdParty-token'