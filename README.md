# 🌟 Blurred Backdrop Sheet



A **beautiful**, **minimal** bottom sheet with blur backdrop effect for Flutter. Inspired by iOS design language with Material 3 support.

## ✨ Features

- 🎨 **Beautiful blur backdrop** with customizable intensity
- 🌙 **Auto dark/light theme** adaptation  
- 👆 **Drag to dismiss** with haptic feedback
- 🎯 **Minimal API** - easy to implement
- ⚡ **Smooth animations** with custom curves
- 🔧 **Highly customizable** without complexity
- 📱 **Material 3** and iOS design support
- 🎭 **Pre-built components** for common use cases


## 🚀 Quick Start

### Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  blurred_backdrop_sheet: ^1.0.0
```

Then run:
```bash
flutter pub get
```

### Basic Usage

```dart
import 'package:blurred_backdrop_sheet/blurred_backdrop_sheet.dart';

// Show a basic blurred sheet
BlurredBackdropSheetController.show(
  context: context,
  child: Container(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hello Beautiful Blur!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  ),
);
```

## 🎨 Customization

### Advanced Configuration

```dart
BlurredBackdropSheetController.show(
  context: context,
  blurIntensity: 25.0,                    // Blur strength (0.0 - 30.0)
  backgroundColor: Colors.blue.withOpacity(0.1),  // Custom overlay color
  borderRadius: BorderRadius.circular(32), // Custom border radius
  isDismissible: true,                    // Enable/disable drag dismiss
  showDragHandle: true,                   // Show/hide drag handle
  animationDuration: Duration(milliseconds: 400), // Custom animation speed
  onDismissed: () => print('Sheet dismissed!'),   // Dismiss callback
  child: YourCustomWidget(),
);
```

### Pre-built Components

Use ready-made components for faster development:

```dart
// Beautiful header with title and subtitle
BlurredSheetHeader(
  title: 'Settings',
  subtitle: 'Customize your experience',
  leading: Icon(Icons.settings),
)

// Enhanced list tiles
BlurredListTile(
  leading: Icon(Icons.share),
  title: Text('Share'),
  subtitle: Text('Share this content'),
  onTap: () => shareContent(),
)
```

## 📖 Examples

### Menu Sheet

```dart
BlurredBackdropSheetController.show(
  context: context,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const BlurredSheetHeader(
        title: 'Quick Actions',
        subtitle: 'Choose an action',
      ),
      BlurredListTile(
        leading: const Icon(Icons.share),
        title: const Text('Share'),
        onTap: () => handleShare(),
      ),
      BlurredListTile(
        leading: const Icon(Icons.favorite),
        title: const Text('Add to Favorites'),
        onTap: () => handleFavorite(),
      ),
    ],
  ),
);
```

### Custom Styled Sheet

```dart
BlurredBackdropSheetController.show(
  context: context,
  blurIntensity: 20.0,
  backgroundColor: Colors.purple.withOpacity(0.1),
  borderRadius: const BorderRadius.vertical(
    top: Radius.circular(40),
  ),
  child: YourCustomContent(),
);
```

## 🎯 API Reference

### BlurredBackdropSheetController

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `child` | Widget | required | Content to display in the sheet |
| `blurIntensity` | double | 15.0 | Blur effect intensity (0.0 - 30.0) |
| `backgroundColor` | Color? | null | Custom overlay background color |
| `borderRadius` | BorderRadius? | 28px top corners | Custom border radius |
| `isDismissible` | bool | true | Enable drag-to-dismiss |
| `showDragHandle` | bool | true | Show drag handle indicator |
| `animationDuration` | Duration | 300ms | Animation duration |
| `onDismissed` | VoidCallback? | null | Callback when dismissed |

### Pre-built Components

- **BlurredSheetHeader**: Professional header with title, subtitle, and icons
- **BlurredListTile**: Enhanced list tile with proper spacing and styling

## 🏗️ Requirements

- Flutter 3.10.0 or higher
- Dart 3.0.0 or higher
- iOS 9.0+ / Android API 16+

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Clone the repository
2. Run `flutter pub get`
3. Run the example: `cd example && flutter run`

## 📄 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by iOS design language
- Built with Flutter's BackdropFilter
- Material 3 design principles

## 📞 Support

- 📝 [Documentation](https://pub.dev/documentation/blurred_backdrop_sheet/latest/)
- 🐛 [Issues](https://github.com/yourusername/blurred_backdrop_sheet/issues)
- 💬 [Discussions](https://github.com/aqibtufail7546)

---

**Made with ❤️ for the Flutter community**