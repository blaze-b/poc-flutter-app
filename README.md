# Poc for the flutter app building

- The Strapi is used for building the backend service.
- The flutter framework is used for the front end UI setup.

## Commands for setting the Strapi

```sh

 node -v

 # for creating the application
 npx create-strapi@latest

 # for starting the application
 npm run develop

```

## Project setup

- Use the VS code for setting up the first flutter project.
- Download the flutter plugin.
- After the plugin download run the short cut `ctrl + sft + P`
- Search for `Flutter: New Project`
- Give the required name for the project.
- [Full cli setup](https://docs.flutter.dev/get-started/install/windows)

## Generic commands

```sh

    # run as web app for testing
    flutter run -d web-server --web-port=8000

    # flutter run with the html imaging: https://docs.flutter.dev/platform-integration/web/renderers
    flutter run -d web-server --web-port=8000 --web-renderer html

    # Add the get X dependency
    flutter pub add get

```

## Hive db for running

- Docs for reference `https://hivedb.dev/#/`

```sh

# Run build task

flutter packages pub run build_runner build

## for deleting conflicting outputs
flutter packages pub run build_runner build --delete-conflicting-outputs

```
