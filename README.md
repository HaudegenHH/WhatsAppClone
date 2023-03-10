# whatsapp_clone

Problem:
"Cannot run with sound null safety, because the following dependencies don't support null safety: emoji-picker-2..."

The problem happens because the Flutter framework (version 2.2.0 and up) is now supporting sound null safety out of the box, but there are plenty of package and plugins on pub.dev are not migrated to null safety yet, so that's raising the error whenever you run a build or run command.

Solutions:
in vscode go to
file -> preferences -> settings -> search for "Flutter run addional args" -> addItem

```sh
"--no-sound-null-safety"
```

or start your project in the console with:

```sh
flutter run --no-sound-null-safety
```
