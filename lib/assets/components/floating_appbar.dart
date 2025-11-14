import 'package:flutter/material.dart' ;

class FloatingAppbar extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final double height;

  const FloatingAppbar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.leading,
    this.actions,
    this.height = 96.0, // Default height, can be overridden
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on provided values or theme defaults
    final Color cardBackgroundColor =
        backgroundColor ?? Theme.of(context).colorScheme.primary;
    final Color contentForegroundColor =
        foregroundColor ?? Theme.of(context).colorScheme.onPrimary;

    return Padding(
      // Outer padding for the floating card effect and increased top distance
      padding: const EdgeInsets.only(
        top: 40.0, // Increased top distance
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: Card(
        color: cardBackgroundColor,
        elevation: 8.0, // Faint shadow and floating effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Padding(
          // Inner padding for the content of the app bar
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: IconTheme(
            // Apply foreground color to all icons within this theme
            data: IconThemeData(color: contentForegroundColor),
            child: Row(
              children: <Widget>[
                if (leading != null)
                  leading!, // Display leading widget if provided
                Expanded(
                  child: Center(
                    // Center the title
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            // color: contentForegroundColor,
                            color: Color.fromARGB(255, 52, 52, 52),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center, // Ensure text is centered
                    ),
                  ),
                ),
                if (actions != null)
                  ...actions!, // Display action widgets if provided
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0), // Margin from all directions
//       child: Card(
//         color: Theme.of(
//           context,
//         ).colorScheme.primary, // Match original AppBar background color
//         elevation: 8.0, // Gives a floating effect
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             16.0,
//           ), // Rounded corners for a modern look
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 8.0,
//           ), // Inner horizontal padding for content
//           child: Row(
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   Icons.menu,
//                   color: Theme.of(context)
//                       .colorScheme
//                       .onPrimary, // Match original AppBar foreground color
//                 ),
//                 onPressed: () {
//                   // No action needed for this example, just showing the icon
//                 },
//               ),
//               Expanded(

//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 20.0,
//                   ), // Add 20px padding from the text top and down
//                   child: Text(
//                     'Simple Counter',
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       color: Theme.of(context)
//                           .colorScheme
//                           .onPrimary, // Match original AppBar foreground color
//                     ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.share,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                 ),
//                 tooltip: 'Share',
//                 onPressed: () {
//                   // No action needed for this example
//                 },
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.info_outline,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                 ),
//                 tooltip: 'Information',
//                 onPressed: () {
//                   // No action needed for this example
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize {
//     // Calculate the preferred height based on the content's needs.
//     // Assuming icon height is roughly kToolbarHeight (56.0) for comparison,
//     // and the text with 20px vertical padding will likely be taller.
//     // Max of (icon height, text height + 20*2 padding)
//     // Let's estimate TextTheme.titleLarge height around 24.0.
//     // So, content height inside row: max(56.0, 24.0 + 40.0) = max(56.0, 64.0) = 64.0
//     // Plus the Card's vertical padding, which was originally 4.0 (now implicit from Card's content).
//     // The Row's actual content height will be around 64.0 (from text and its padding).
//     // The outer padding of the Card is 16.0 top and 16.0 bottom = 32.0.
//     // So, 64.0 (for inner Row content) + 32.0 (outer padding) = 96.0.
//     // return const Size.fromHeight(96.0);
//     return const Size.fromHeight(100.0); // Set a fixed height for the floating app bar
//   }
// }
