part of widget;

class ProfileInfoCardX extends StatelessWidget {
  const ProfileInfoCardX({required this.title,required this.value,super.key});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(width: 80,child: TextX(title,color: ColorX.greyDark,),),
          TextX(value),
        ],
      ),
    );
  }
}
