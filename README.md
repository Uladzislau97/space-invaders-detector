# Space Invaders Detector

Program to detect invaders in radio signals. To get coordinates you can use class `DetectInvaders` and pass to it:
- `radar_signal` - string
- `known_invaders` - array of strings

Result is return in form of: `{ top_left: [x, y], bottom_right: [x, y] }`

To run tests and linter you can type `make check`.
