---
name: 📱 elite-mobile
description: Premium Expo & React Native development with fluid animations and modern architecture.
category: mobile
---

# Elite Mobile Development

Use `/elite-mobile` for high-end mobile app development. Focus on native-feel performance, fluid motion, and professional layouts.

## Tech Stack
- **Framework**: Expo (SDK 51+)
- **Styling**: NativeWind or custom stylesheets with design tokens.
- **Motion**: React Native Reanimated (Spring physics only).
- **Icons**: Lucide React Native.
- **Storage**: SQLite or WatermelonDB (local-first).

## Premium Design Rules
- **Touch-First**: Minimum tap targets 44x44. Haptic feedback on all major interactions.
- **Layout**: Respect safe areas. Use bottom sheets for complex inputs.
- **Motion**: Use `Layout.springify()` for entry/exit animations. 0.3s duration max.
- **Visuals**: Vibrant gradients, card-based layouts, and high-fidelity typography (Inter).

## Expo Best Practices
- **Navigation**: Expo Router (File-based). Use groups for logical isolation.
- **Build**: EAS Build for production. Use Dev Clients for local testing.
- **Performance**: Memoize heavy components. Use FlashList for long lists.

## Commands
- `/elite-mobile-init`: Sets up a premium Expo boilerplate.
- `/elite-mobile-view`: Generates a full screen with transitions and local state.
