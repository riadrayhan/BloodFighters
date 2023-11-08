import 'package:flutter/material.dart';

class BloogPage extends StatefulWidget {
  const BloogPage({super.key});

  @override
  State<BloogPage> createState() => _BloogPageState();
}

class _BloogPageState extends State<BloogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xDDB70404),
        centerTitle: true,
        title: Text("Blog Page",style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width/1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("গরু যখন রক্তদাতা! \n\nমানুষের ক্ষেত্রে ABO সিস্টেম ও Rh সিস্টেম বিশ্বজুড়ে প্রচলিত। এই দুই সিস্টেম অনুযায়ী A, B, O ও AB এই চার ধরনের রক্তের গ্রুপের প্রতিটির (+) ও (-) অ্যান্টিজেন আছে। এই মোট ৮ ধরনের রক্ত মানুষের শরীরে পাওয়া যায়। গরুর বেলায় A, B, C, F,J, L, M, R, S, T ও Z এই ১১ টি প্রধান রক্তের গ্রুপ পাওয়া যায়। এর মধ্যে শুধুমাত্র B গ্রুপেরই ৬০ টির উপরে অ্যান্টিজেন আছে। এছাড়াও আরও কিছু অপ্রধান গ্রুপের রক্তে আছে যেগুলো সচরাচর পাওয়া যায় না। এজন্য গরুর রক্ত মানুষ তো দূরের কথা এক গরু থেকে অন্য গরুতেই সঞ্চালন করা দূরুহ ব্যাপার।এখন বলছি কেন B+ve কে গরুর রক্ত বলা হয়? আমাদের এশিয়া মহাদেশে B+ve গ্রুপধারী মানুষের সংখ্যা অন্য যে কোন গ্রুপধারীর চেয়ে বেশি। ফলে কাউকে যদি রক্তের গ্রুপ জিজ্ঞাসা করা হয় তাহলে উত্তর B+ve হওয়ার সম্ভাবনাই বেশি। এজন্য হয়তোবা B+ve কে গরুর রক্ত বলা হয়। তবে এশিয়ায় B+ve ধারীর সংখ্যা প্রায় ৩০% হলেও ইউরোপ বা আমেরিকায় তা মাত্র ১০%। তাই আমাদের দেশে B+ve রক্তধারী মানুষ যেমন বেশি এর রুগী সংখ্যাও বেশি। তাই B+ve রক্তের প্রয়োজনকে অবহেলা না করে সমান গুরুত্ব দিয়ে রক্ত দানে এগিয়ে আসুন।"),
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width/1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("কোন ধরণের রোগীর জন্য সাধারণত কত ব্যাগ রক্ত লাগে \n\n১. সিজারের জন্য ১-২ ব্যাগ ।\n২. রক্ত-স্বল্পতা/অ্যামিনিয়া রোগির জন্য ১-২ ব্যাগ।\n৩. থ্যালাসিমিয়া রোগির জন্য- প্রতি মাসে ১ ব্যাগ, অনেক সময় প্রতি সপ্তাহে ১-২ ব্যাগ লাগে।\n৪. ওপেন হার্ট সার্জারির জন্য ৪-৬ ব্যাগ রক্ত লাগে।\n৫. বাইপাস সার্জারি, অপারেশনের জন্য ৩-৪ ব্যাগ।\n৬. কিডনি ডায়ালসিসের জন্য ১-২ ব্যাগ।\n৭. ব্লাড ক্যান্সারের রোগির জন্য Unlimited.. অন্যান্য ক্যান্সারের ক্ষেত্রে প্রতি মাসে ১-২ ব্যাগ।\n৮. লিভারের রোগির জন্য- রোগের অবস্থা অনুসারে প্রতি মাসে ৫-১০ ব্যাগ রক্ত লাগে।\n৯. এক্সিডেন্টের রোগির জন্য- রোগির অবস্থা অনুসারে।\n১০. রক্ত বমি - এ রোগে ১-২ ব্যাগ রক্তের প্রয়োজন হয়।\n১১. ডেঙ্গু জ্বর - এ রোগে ৪ ব্যাগ রক্ত হতে ১ ব্যাগ Platelet (রক্তের সাদা অংশ) পৃথক করে রোগীর শরীরে দেয়া হয়।"),
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width/1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("রক্তদানের উপকারিতা \n\n► রক্ত দানের সময় হেপাটাইসিস বি, সি,সিফিলিস, ম্যলেরিয়া এবং এইডস এই ৫টি রোগের স্ক্রিনিং রিপোর্ট পাওয়া যাবেবিনামূল্যে, যা তাকে আশ্বস্ত করেতার সুস্থতা সম্পর্কে, যেটা সাধারন মানের কোন ডায়াগনস্টিক সেন্টারে কমপহ্মে কয়েক হাজার টাকা খরচ হবে।\n► রক্তেযদি লৌহের পরিমাণ বেশি থাকে তাহলে কোলেস্টেরলের অক্সিডেশনের পরিমাণ বেড়ে যায় ও ধমনী ক্ষতিগ্রস্থ হয়। যার ফলশ্রুতিতে হৃদরোগের ঝুঁকি বৃদ্ধি পায়। নিয়মিত রক্তদিলে দেহে এই লৌহের পরিমাণ কমে যা হৃদরোগের ঝুঁকিকেও কমিয়ে দেয় কার্যকরীভাবে।\n► মিলার-কিস্টোন ব্লাডসেন্টারের একগবেষণায় দেখা যায়, নিয়মিত রক্তদিলে ক্যান্সারের ঝুঁকি কমে। বিশেষ করে ফুসফুস, লিভার, কোলন, পাকস্থলী ওগলার ক্যান্সারের ঝুঁকি নিয়মিত রক্তদাতাদের ক্ষেত্রে অনেক কম বলে দেখা গেছে।\n► ৪০০মিলিলিটার রক্ত দান করলে রক্ত দাতার দেহ থেকে ৫৭০ ক্যলোরি শক্তি হ্ময় হয়, তাতে রক্তে শর্করার পরিমান স্বাভাবিক থাকে যা ডায়বেটিসের ঝুঁকি কমায়।\n► নিয়মিত রক্তদানে দাতার শরীরের কিছু ভালো পরিবর্তন সাধিত হয়। কোনো দুর্ঘটনাজনিত কারণে দাতার শরীর থেকে কিছু রক্তপাত হলেও তার কোনো সমস্যা হয় না!\n► প্রতি ৪ মাস অন্তর রক্ত দিলে দেহে নতুন Blood Cell তৈরীর প্রণোদনা সৃষ্টি হয়। এতে দেহের রোগ প্রতিরোধ ক্ষমতা অনেকগুণ বেড়ে যায়।\n► রক্তদান করার সাথে সাথে আমাদের শরীরের মধ্যে অবস্থিত অস্থিমজ্জা (Bone Marrow) নতুন কণিকা তৈরির জন্য উদ্দীপ্ত হয়। রক্ত দান করার মাত্র ৪৮ ঘন্টার মধ্যেই দেহে রক্তের পরিমাণ স্বাভাবিক হয়ে যায় আর লোহিত কণিকার ঘাটতি পূরণ হতে সময় লাগে ৪ থেকে ৮ সপ্তাহ। আর এই পুরো প্রক্রিয়া আসলে শরীরের সার্বিক সুস্থতা, প্রাণবন্ততা আর কর্মক্ষমতাকেই বাড়িয়ে দেয়| \n► মুমূর্ষু মানুষকে রক্তদান করে আপনি পাবেন মানসিক তৃপ্তি। \n► কোনো সেন্টারে একবার রক্তদান করলে ওই সেন্টার দাতার প্রয়োজনে যেকোনো সময় রক্ত সরবরাহ করে থাকে।\n► রক্তদানের মাধ্যমে মানুষের প্রতি মানুষের মমত্ববোধ বাড়ে।\n► রক্তদান ধর্মীয় দিক থেকে অত্যন্ত পুণ্যের বা সওয়াবের কাজ। পবিত্র কোরআনের সূরা মায়েদার ৩২ নং আয়াতে আছে, ‘একজন মানুষের জীবন বাঁচানো সমগ্র মানব জাতির জীবন বাঁচানোর মতো মহান কাজ।’ ঋগ্‌বেদে বলা হয়েছে ‘নিঃশর্ত দানের জন্যে রয়েছে চমৎকার পুরস্কার। তারা লাভ করে আশীর্বাদধন্য দীর্ঘজীবন ও অমরত্ব।’ "),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
