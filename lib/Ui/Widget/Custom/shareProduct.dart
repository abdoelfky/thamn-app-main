part of widget;

class ShareProductX extends StatelessWidget {
  const ShareProductX({super.key,this.product, required this.users});
  final ProductX? product;
  final List<UserX> users;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(UserX user in users)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15.0),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 44,backgroundColor: ColorX.greyDark.withOpacity(0.15),child: CircleAvatar(backgroundColor: Colors.transparent,radius: 35,backgroundImage: NetworkImage(user.image)),),
                        const SizedBox(height: 10,),
                        TextX(user.name,style: TextStyleX.titleSmall,)
                      ],
                    ),
                  )
              ],
            )),
        const SizedBox(height: 10,),
        const Divider(
          endIndent: 30,
          indent: 30,
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage(IconX.facebookShare),
                  height: 75,
                  fit: BoxFit.fitHeight,
                )),
            GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage(IconX.messengerShare),
                  height: 75,
                  fit: BoxFit.fitHeight,
                )),
            GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage(IconX.twitterShare),
                  height: 75,
                  fit: BoxFit.fitHeight,
                )),
            GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage(IconX.whatsappShare),
                  height: 75,
                  fit: BoxFit.fitHeight,
                )),
          ],
        )
      ],
    );
  }
}
