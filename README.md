# Products List App

## Use Cases

### Load products from exposed mocked API endpoint.

#### Data:
- Mocked API Endpoint: https://run.mocky.io/v3/1c4cfa98-e329-4d49-8836-8ee195cec131

#### Primary course (happy path):
1. Execute "products" command with above API Endpoint.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates list of products from valid data.
5. System presents list of products with most important datas: 
    - name
    - price
    - description
    - image.
    
#### Invalid data – error course (sad path):
1. Products previously retrived - system presents cached products basic information without images.
2. Products not retrived previously - system presents error screen with option to retry request.

#### No connectivity – error course (sad path):
1. System presents connectivity error screen.

## Architecture

App has been designed using MVP Architecture patter connected with Coordinator pattern. 

## Interface

App interface has been created using SwiftUI, adjusted to support iOS versions from iOS 13 up to the newest one (for Feb '23) iOS 16.
App supports Dark and Light mode.
App supports vertical and horizontal screen position.

## Internationalization

App possess English language support extracted to localized file which allow add any additional language to the app in future. 

## Dependencies

App does not use any 3rd party dependencies.

## Example Data Payload

```
GET https://run.mocky.io/v3/1c4cfa98-e329-4d49-8836-8ee195cec131

200 RESPONSE

[
    {
        "id": "d366cc25-19f8-4e84-96a5-5d06f5e1a529",
        "name": "Product 1",
        "price": 9.99,
        "description": "This is the description for Product 1",
        "image_url": "https://picsum.photos/id/1000/600/400"
    },
    {
        "id": "ab29b62e-8d2e-4f70-9bda-6b8eb6e56c40",
        "name": "Product 2",
        "price": 19.99,
        "description": "This is the description for Product 2",
        "image_url": "https://picsum.photos/id/1001/600/400"
    },
    {
        "id": "08a9c5e5-afcb-45ab-9740-3f7e2ddbe8b2",
        "name": "Product 3",
        "price": 29.99,
        "description": "This is the description for Product 3",
        "image_url": "https://picsum.photos/id/1002/600/400"
    }
]
