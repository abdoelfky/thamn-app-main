part of widget;

class SocialMediaLogCardX extends StatelessWidget {
  const SocialMediaLogCardX({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final String icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ContainerX(
        child: Row(children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(icon),
          ),
          const SizedBox(
            width: 20,
          ),
          TextX(title),
        ]),
      ),
    );
  }
}
