# Stack Rules: Expo + React Native

> Copy to `.agent/rules/stack.md` in Expo/React Native projects.

---

## Expo Conventions

- **Expo Router** (File-based routing) is the standard. Use `app/` directory.
- **SDK Version**: Target latest stable (currently SDK 51+).
- **Navigation**: Use `Stack`, `Tabs`, and `Drawer` from `expo-router`. Organize with groups `(tabs)`, `(auth)`.
- **EAS**: Use `eas.json` for build profiles. `development`, `preview`, `production`.
- **Assets**: Use `expo-asset` and `expo-font` for resource management.

## React Native Patterns

- **Functional Components** with `TypeScript`.
- **Styling**: NativeWind (Tailwind) or `StyleSheet`. Prefer NativeWind for speed.
- **Animations**: `react-native-reanimated` is MANDATORY for all transitions. No `Animated` API.
- **Haptics**: Use `expo-haptics` for tactile feedback on interactions.
- **Safe Area**: Always wrap screens in `SafeAreaView` from `react-native-safe-area-context`.

## Elite Design & Creativity

- **Mobile-First Luxury**: Use large tap targets (min 44x44). Use generous padding and subtle shadows.
- **Fluid Motion**: Every screen transition and state change must be animated. Use `layout={LinearTransition}` or custom `Entering`/`Exiting` animations.
- **Glassmorphism**: Use `expo-blur` for premium background effects.
- **Typography**: Match platform defaults (San Francisco/Roboto) or use Inter/Geist via `expo-font`.
- **Haptics**: Light haptic on tap, success haptic on form completion, error haptic on failure.

## Performance

- **FlashList**: Use `@shopify/flash-list` instead of `FlatList` for heavy lists.
- **Images**: Use `expo-image` for high-performance caching and smooth loading transitions.
- **Memoization**: Be aggressive with `React.memo` for list items and heavy UI components.

## Common Gotchas

- No `div`, `span`, or `p`. Use `View`, `Text`, `Pressable`.
- Z-index works differently than web; use elevation on Android.
- Shadow props only work on iOS; use `elevation` or `expo-shadow` for Android.
- Always use `useCallback` for event handlers passed to heavy components.
