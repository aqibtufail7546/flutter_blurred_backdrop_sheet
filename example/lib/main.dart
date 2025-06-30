import 'package:flutter/material.dart';
import 'package:blurred_backdrop_sheet/blurred_backdrop_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blurred Backdrop Sheet Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blurred Backdrop Sheet'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.blur_on,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Beautiful Blur Effects',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap any button below to see the blurred backdrop sheet in action',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Demo buttons
            _DemoButton(
              title: 'Basic Sheet',
              subtitle: 'Simple blur with minimal content',
              icon: Icons.blur_circular,
              onPressed: () => _showBasicSheet(context),
            ),
            const SizedBox(height: 12),

            _DemoButton(
              title: 'Menu Sheet',
              subtitle: 'Action menu with list items',
              icon: Icons.menu,
              onPressed: () => _showMenuSheet(context),
            ),
            const SizedBox(height: 12),

            _DemoButton(
              title: 'Settings Sheet',
              subtitle: 'Settings panel with options',
              icon: Icons.settings,
              onPressed: () => _showSettingsSheet(context),
            ),
            const SizedBox(height: 12),

            _DemoButton(
              title: 'Custom Styled',
              subtitle: 'Custom colors and styling',
              icon: Icons.palette,
              onPressed: () => _showCustomSheet(context),
            ),
            const SizedBox(height: 12),

            _DemoButton(
              title: 'High Blur Effect',
              subtitle: 'Maximum blur intensity',
              icon: Icons.blur_on,
              onPressed: () => _showHighBlurSheet(context),
            ),
            const SizedBox(height: 12),

            _DemoButton(
              title: 'Non-Dismissible',
              subtitle: 'Sheet that cannot be dragged away',
              icon: Icons.lock,
              onPressed: () => _showNonDismissibleSheet(context),
            ),

            const SizedBox(height: 32),

            // Info card
            Card(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Package Features',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '• Drag to dismiss with haptic feedback\n'
                      '• Automatic dark/light theme adaptation\n'
                      '• Customizable blur intensity\n'
                      '• Smooth animations with custom curves\n'
                      '• Pre-built components for common use cases',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickActionsSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('Quick Actions'),
      ),
    );
  }

  void _showBasicSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.blur_circular,
                size: 32,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Beautiful Blur Effect!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'This is a basic blurred backdrop sheet with minimal setup. The backdrop automatically adapts to your app\'s theme.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Got it!'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenuSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Custom header
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Quick Actions',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose an action to perform',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            // Menu items
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              subtitle: const Text('Share this content with others'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Shared successfully!');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Add to Favorites'),
              subtitle: const Text('Save for later viewing'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Added to favorites!');
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download'),
              subtitle: const Text('Save to your device'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Download started!');
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              subtitle: const Text('Make changes to this item'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Opening editor...');
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showSettingsSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Custom header
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Customize your experience',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Settings items
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              subtitle: const Text('Manage your notification preferences'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Opening notifications settings...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy & Security'),
              subtitle: const Text('Control your privacy settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Opening privacy settings...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Appearance'),
              subtitle: const Text('Customize the app appearance'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Opening appearance settings...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: const Text('Change app language'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Opening language settings...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              subtitle: const Text('Get help and contact support'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context, 'Opening help & support...');
              },
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showSnackBar(context, 'Settings saved!');
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      blurIntensity: 25.0,
      backgroundColor: Colors.purple.withOpacity(0.15),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Custom Styled Sheet',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'This sheet demonstrates custom styling with increased blur intensity, custom background color, and rounded corners.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Awesome!'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHighBlurSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      blurIntensity: 30.0,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.blur_on,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Maximum Blur',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'This sheet uses the maximum blur intensity of 30.0 for an even more dramatic effect.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  void _showNonDismissibleSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      isDismissible: false,
      showDragHandle: false,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Non-Dismissible Sheet',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'This sheet cannot be dismissed by dragging. You must use the button below.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close Sheet'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuickActionsSheet(BuildContext context) {
    BlurredBackdropSheetController.show(
      context: context,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quick Actions',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _QuickActionButton(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackBar(context, 'Opening camera...');
                  },
                ),
                _QuickActionButton(
                  icon: Icons.photo_library,
                  label: 'Gallery',
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackBar(context, 'Opening gallery...');
                  },
                ),
                _QuickActionButton(
                  icon: Icons.file_present,
                  label: 'Files',
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackBar(context, 'Opening files...');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _DemoButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const _DemoButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
