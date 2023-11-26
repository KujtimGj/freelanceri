import 'package:Freelanceri/core/dimensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:get/get.dart';

class Apply extends StatefulWidget {
  final PostModel? posts;
  const Apply({super.key,this.posts});

  @override
  State<Apply> createState() => _ApplyState();
}


class _ApplyState extends State<Apply> {
  int selectedIndex = 0;

  final List<String> items = [
    'Më pak se një javë',
    'Më pak se një muaj',
    '1 deri 3 muaj',
    '3 deri 6 muaj',
    'Më shumë se 6 muaj',
  ];
  String? selectedValue;

  TextEditingController oferta = TextEditingController();
  String? newValue;

  void calculateAndSet10PercentLess() {
    double currentValue = double.tryParse(oferta.text) ?? 0.0;

    double newValue = currentValue - (currentValue * 0.1);

    setState(() {
      this.newValue = newValue.toStringAsFixed(2);
    });
  }



  @override
  void initState() {
    calculateAndSet10PercentLess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        shadowColor: primaryBlue,
        centerTitle: true,
        title: SvgPicture.asset("assets/svg/apply.svg"),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryBlue,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.03),
              child: const Text(
                "Apliko për",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children:[
                               Icon(Icons.account_circle_sharp,size: 50, color: Colors.grey[500],),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: getPhoneWitdth(context)*0.6,
                                    child: Text(
                                      widget.posts!.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                          fontSize: 20, fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    "Filan Fisteku",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey[500]),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.bookmark_outline,
                            color: primaryBlue,
                            size: 35,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,10,20),
                      child: Text(widget.posts!.description,overflow: TextOverflow.ellipsis,maxLines: 4,),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.03),
              child: const Text(
                "Oferta",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.015),
                    height: size.height * 0.07,
                    width: size.width * 0.43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: selectedIndex == 0
                                ? primaryBlue
                                : Colors.transparent,
                            width: 1),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "Sipas objektivav",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.015),
                    height: size.height * 0.07,
                    width: size.width * 0.43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: selectedIndex == 1
                                ? primaryBlue
                                : Colors.transparent,
                            width: 1),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "Sipas projektit",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            selectedIndex==1?Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.03),
              child: Text(
                "Merrni të gjithë pagesën tuaj në fund, kur të jetë dorëzuar e gjithë puna.",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ):Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.03),
              child: Text(
                "Merrni të gjithë pagesën tuaj në bazë të detyrave qe ju perfundoni gjatë projektit.",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            selectedIndex==0?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.06, top: size.height * 0.02,bottom: size.height*0.02),
                  child:const Text("Sa objektiva deshironi ti shtoni?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.06, top: size.height * 0.01,bottom: size.height*0.01),
                  child:const Text("Objektiva e parë",style: TextStyle(fontSize: 15,)),
                ),
                Center(
                  child: SizedBox(
                    height:size.height*0.05,
                    width: size.width*0.9,
                    child: TextField(
                      decoration:InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          hintText: "Objektiva",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.35))
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.35))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 1,color: primaryBlue)
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Për datën",style:TextStyle(fontSize: 14),),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: size.height*0.05,
                          width: size.width*0.4,
                          child: TextField(
                            decoration:InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                // hintText: "Objektiva",
                                // hintStyle: const TextStyle(fontSize: 14),
                                suffixIcon: const Icon(Icons.calendar_today_sharp,size: 20,color: Colors.grey,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.35))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.35))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1,color: primaryBlue)
                                )
                            ),

                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Shuma në €",style: TextStyle(fontSize: 14),),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: size.height*0.05,
                          width: size.width*0.4,
                          child: TextField(
                            textAlign: TextAlign.right,
                            decoration:InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                hintText: "\$0.00",
                                hintStyle: const TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(width: 1.5,color: Colors.black.withOpacity(0.35))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(width: 1.5,color: Colors.black.withOpacity(0.35))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1,color: primaryBlue)
                                )
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width*0.06,top: size.height*0.02),
                  child: const Text(" + Shto objektivë",style: TextStyle(color: primaryBlue,fontSize: 15),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.035,vertical: 10),
                  child:const Divider(height: 10,thickness: 1),
                ),
                Padding(
                  padding:EdgeInsets.only(top: size.height*0.01,left: size.width*0.05),
                  child: const Text("Çmimi total i projektit",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: size.height*0.02,horizontal: size.width*0.05),
                  child: Text("Ky çmim perfshin të gjitha objektivat, dhe është shuma që klienti juaj do të shoh",style: TextStyle(color: Colors.grey[600]),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.01,horizontal: size.width*0.05),
                  child: const Text("20.00€",style: TextStyle(fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.035,vertical: 10),
                  child:const Divider(height: 10,thickness: 1),
                ),
                Padding(
                  padding:EdgeInsets.only(top: size.height*0.01,left: size.width*0.05),
                  child: const Text("10% tarifa per freelancer",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.01,horizontal: size.width*0.05),
                  child: const Text("- 2.00€",style: TextStyle(fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.035,vertical: 10),
                  child:const Divider(height: 10,thickness: 1),
                ),
                Padding(
                  padding:EdgeInsets.only(top: size.height*0.01,left: size.width*0.05),
                  child: const Text("Ju do të perfitoni",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: size.height*0.02,horizontal: size.width*0.05),
                  child: Text("Pagesa juaj e parashikuar, pas tarifave të shërbimit",style: TextStyle(color: Colors.grey[600]),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.01,horizontal: size.width*0.05),
                  child: const Text("18.00€",style: TextStyle(fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.035,vertical: 10),
                  child:const Divider(height: 10,thickness: 1),
                ),
              ],
            )
                :
            Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(height: size.height*0.025),
                  const Text("Sa është shuma e parave qe ofroni për ketë punë?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  SizedBox(height: size.height*0.025),
                  const Text("Oferta",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  SizedBox(height: size.height*0.02),
                  Text("Shuma totale qe klienti juaj do ta shoh ne propozimin tuaj",style: TextStyle(fontSize: 13,color: Colors.grey[500])),
                  SizedBox(height: size.height*0.025),
                  SizedBox(
                    width: size.width*0.5,
                    child: TextField(
                      onEditingComplete: (){
                        calculateAndSet10PercentLess();
                        FocusScope.of(context).unfocus();

                      },
                      textAlign: TextAlign.right,
                      textAlignVertical: TextAlignVertical.center,
                      controller: oferta,
                      keyboardType: TextInputType.number,
                      decoration:InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.35))
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.35))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 1,color: primaryBlue)
                          )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(height: 10,thickness: 1),
                  ),
                  const Text("10% tarifa per freelancer",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  SizedBox(height: size.height*0.025),
                  SizedBox(
                    height: size.height*0.05,
                    width: size.width*0.5,
                    child: Text(
                      textAlign: TextAlign.right,
                      "-10%",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(height: 10,thickness: 1),
                  ),
                  const Text("Ju do të fitoni",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  SizedBox(height: size.height*0.02),
                  Text("Pagesa juaj e parashikuar, pas tarifave të shërbimit",style: TextStyle(fontSize: 13,color: Colors.grey[500]),),
                  SizedBox(height: size.height*0.02),
                  SizedBox(
                    width: size.width*0.5,
                    child: TextField(
                      enabled: false,
                      textAlign: TextAlign.right,
                      decoration:InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          hintText: newValue,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.black.withOpacity(0.2))
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.03),
              child: const Text(
                "Kohezgjatja e projektit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Më pak se një javë',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.03),
              child: const Text(
                "Të dhëna shtesë",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, top: size.height * 0.015,),
              child: const Text("Letra e motivimit",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.03,
                  left: size.width * 0.03,
                  top: size.height * 0.02),
              child: Container(
                height: size.height * 0.3,
                margin: EdgeInsets.only(bottom: size.height*0.02),
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    // contentPadding: const EdgeInsets.symmetric(vertical: 50),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      hintText: 'Letra e motivimit',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2), width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: primaryBlue, width: 1),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.06, top: size.height * 0.015,),
              child: const Text("Shtojca",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            ),
            Container(
              height: size.height*0.04,
              width: size.width*0.3,
              margin: EdgeInsets.only(top: size.height*0.03,left: size.width*0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primaryBlue,width: 2)
              ),
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attachment,color: primaryBlue,),
                  Text("Shtojca",style: TextStyle(color: primaryBlue),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:size.width*0.04,right:size.width*0.04,top: size.height*0.03),
              child: Text("Mund të bashkëngjitni deri në 10 skedarë nën madhësinë 25 MB secili. Përfshini mostrat e punës ose dokumente të tjera për të mbështetur aplikimin tuaj.",style: TextStyle(color: Colors.grey[500]),),
            ),
            SizedBox(height: size.height*0.06),
            Center(
              child: Container(
                height: size.height*0.08,
                width: size.width*0.9,
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text("Dërgo aplikimin",style: TextStyle(color: Colors.white,fontSize: 17),),
                ),
              ),
            ),
            SizedBox(height: size.height*0.06),
          ],
        ),
      ),
    );
  }
}
