import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:d_chart/d_chart.dart';
import 'package:eirmuplb/reusable_widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class SurveysRoute extends StatefulWidget {

  @override
  _SurveysRouteState createState() => _SurveysRouteState();
}

class _SurveysRouteState extends State<SurveysRoute> {
  final List<Widget> _charts = [];

  int touchedIndex = -1;
  final CarouselController controller = CarouselController();
  int activeIndex = 0;
  int activeIndex1 = 0;
  int activeIndex2 = 0;
  int activeIndex3 = 0;
  int activeIndex4 = 0;
  @override
  Widget build(BuildContext context) {
    CarouselSliderControllerImpl controller = CarouselSliderControllerImpl();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF27ae60),
          title: const Text('Practices against FAW'),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'Recorded Crop Protection Practices of Corn Farmers in Luzon, Visayas and Mindanao for FAW control.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
              ),
              // Padding(padding: const EdgeInsets.all(8.0),child: Text(
              //     'Multiple researches have been done with data collection pertaining to corn farmer\'s crop protection practices.')
              // ),
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'Data were collated from 262 farmers surveyed and  conducted from June 2022 up to December 2022:')
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: 11,
                      itemBuilder: (context, index, realIndex) {
                        // if (index ==0)
                        // return buildChart();
                        switch (index) {
                          case 0:
                            return oldgenderChart1();
                          case 1:
                            return oldageChart();
                          case 2:
                            return oldeducationChart();
                          case 3:
                            return oldcivilstatusChart();
                          case 4:
                            return oldfarmsizeChart();
                          case 5:
                            return oldyearsChart();
                          case 6:
                            return oldcornareaChart();
                          case 7:
                            return olddemographicsChart();
                          case 8:
                            return oldownershipChart();
                          case 9:
                            return oldemploymentChart();
                          case 10:
                            return oldPlantedChart();
                          // case 11:
                          //   return buildChart();
                          default:
                            throw Error();
                        }
                      },
                      options: CarouselOptions(
                        height: 500,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex = index);
                          print(activeIndex);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator(11),
                ],
              ),
              SizedBox(height: 35,),
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'Among the surveyed farmers, here are the data pertaining to the benefits they received from Agricultural programs.')
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        // if (index ==0)
                        // return buildChart();
                        switch (index) {
                          case 0:
                            return providerChart();
                          case 1:
                            return farminputChart();
                          case 2:
                            return hostChart();
                          case 3:
                            return programsChart();
                          case 4:
                            return seminarsChart();
                          default:
                            throw Error();
                        }
                      },
                      options: CarouselOptions(
                        height: 450,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex1 = index);
                          print(activeIndex1);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator1(5),
                  const SizedBox(height: 32,),
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'Farmers were also asked to write down their insecticide usage history, with special distinction between the time of the arrival of FAW in the Philippines (in 2019) and the dates prior to the initial infestation.')
              ),
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'Here are the data pertaining to thesurveyed farmers\' insecticide usage prior to 2019.')
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        // if (index ==0)
                        // return buildChart();
                        switch (index) {
                          case 0:
                            return pampangapreChart();
                          case 1:
                            return pangasinanpreChart();
                          case 2:
                            return boholpreChart();
                          case 3:
                            return cebupreChart();
                          case 4:
                            return skpreChart();
                          default:
                            throw Error();
                        }
                      },
                      options: CarouselOptions(
                        height: 750,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex2 = index);
                          print(activeIndex2);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator2(5),
                  const SizedBox(height: 32,),
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'Among the surveyed farmers, here are the data pertaining to their insecticide usage after 2019.')
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        // if (index ==0)
                        // return buildChart();
                        switch (index) {
                          case 0:
                            return pampangapostChart();
                          case 1:
                            return pangasinanpostChart();
                          case 2:
                            return boholpostChart();
                          case 3:
                            return cebupostChart();
                          case 4:
                            return skpostChart();
                          default:
                            throw Error();
                        }
                      },
                      options: CarouselOptions(
                        height: 750,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex3 = index);
                          print(activeIndex3);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator3(5),
                  const SizedBox(height: 32,),
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0),child: Text(
                  'The farmers\' usage of alternatives other than commercial insecticides were also surveyed, here are the data pertaining to their use of household items in place of insecticides after 2019.')
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        // if (index ==0)
                        // return buildChart();
                        switch (index) {
                          case 0:
                            return pampangaposthhChart();
                          case 1:
                            return pangasinanposthhChart();
                          case 2:
                            return boholposthhChart();
                          case 3:
                            return cebuposthhChart();
                          case 4:
                            return skposthhChart();
                          default:
                            throw Error();
                        }
                      },
                      options: CarouselOptions(
                        height: 450,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex4 = index);
                          print(activeIndex4);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator4(5),
                  const SizedBox(height: 32,),

                ],
              ),
            ],
          ),
        )
    );
  }
  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    activeIndex: activeIndex,
    count: count,
    effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10
    ),
  );
  Widget buildIndicator1(int count) => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    activeIndex: activeIndex1,
    count: count,
    effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10
    ),
  );
  Widget buildIndicator2(int count) => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    activeIndex: activeIndex2,
    count: count,
    effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10
    ),
  );
  Widget buildIndicator3(int count) => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    activeIndex: activeIndex3,
    count: count,
    effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10
    ),
  );
  Widget buildIndicator4(int count) => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    activeIndex: activeIndex4,
    count: count,
    effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10
    ),
  );

  void animateToSlide(int index) => controller.animateToSlide(index);

  Widget oldgenderChart1() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Gender distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 260 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(2, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 36.15,
                          title: '36.15%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 63.85,
                          title: '63.85%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.purple,
                  text: 'Female - 166',
                  isSquare: true,
                ),
                SizedBox(
                  height: 14,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: 'Male - 94',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldageChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Age distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 254 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(7, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 0.39,
                          title: '0.39%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 2.76,
                          title: '2.76%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 11.02,
                          title: '11.02%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 28.35,
                          title: '28.35%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 4:
                        return PieChartSectionData(
                          color: Colors.red,
                          value: 31.10,
                          title: '31.10%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 5:
                        return PieChartSectionData(
                          color: Colors.brown,
                          value: 21.65,
                          title: '21.65%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 6:
                        return PieChartSectionData(
                          color: Colors.orange,
                          value: 4.72,
                          title: '4.72%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: '>20 - (1)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: '21-30 - (7)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: '31-40 - (28)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: '41-50 - (72)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.red,
                  text: '51-60 - (79)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.brown,
                  text: '61-70 - (55)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.orange,
                  text: '71-80 - (12)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldeducationChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Educational background distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 262 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(6, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 18.70,
                          title: '18.70%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 7.25,
                          title: '7.25%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 4.96,
                          title: '4.96%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 30.53,
                          title: '30.53%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 4:
                        return PieChartSectionData(
                          color: Colors.red,
                          value: 36.64,
                          title: '36.64%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 5:
                        return PieChartSectionData(
                          color: Colors.brown,
                          value: 1.91,
                          title: '1.91%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: 'College - 49',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: 'Undergrad - 19',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: 'Vocational - 13',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: 'Highschool - 80',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.red,
                  text: 'Elementary - 96',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.brown,
                  text: 'Others - 5',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldcivilstatusChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Civil status distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 255 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(3, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 83.14,
                          title: '83.14%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 10.20,
                          title: '10.20%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 6.67,
                          title: '6.67%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: 'Married - 212',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: 'Single - 26',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: 'Widowed - 17',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldfarmsizeChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Farm size distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 260 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(6, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 85.38,
                          title: '85.38%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 10.00,
                          title: '10.00%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 3.85,
                          title: '3.85%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 0.38,
                          title: '0.38%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 4:
                        return PieChartSectionData(
                          color: Colors.red,
                          value: 0.38,
                          title: '0.38%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 5:
                        return PieChartSectionData(
                          color: Colors.brown,
                          value: 0.0,
                          title: '0.0%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: '< 2.0 - (222)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: '2.1-4.0 - (26)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: '4.1-6 - (10)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: '6.1-8 - (1)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.red,
                  text: '8.1-10 - (1)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.brown,
                  text: '>10 - (0)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldyearsChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Years in corn production distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 233 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(6, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 43.78,
                          title: '43.78%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 19.74,
                          title: '19.74%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 11.59,
                          title: '11.59%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 8.58,
                          title: '8.58%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 4:
                        return PieChartSectionData(
                          color: Colors.red,
                          value: 4.72,
                          title: '4.72%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 5:
                        return PieChartSectionData(
                          color: Colors.brown,
                          value: 11.59,
                          title: '11.59%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: '1-10 - (102)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: '11-20 - (46)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: '21-30 - (27)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: '31-40 - (20)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.red,
                  text: '41-50 - (11)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.brown,
                  text: '>50 - (27)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldcornareaChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Area devoted to corn distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 226 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(6, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 91.59,
                          title: '91.59%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 7.08,
                          title: '7.08%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 0.88,
                          title: '0.88%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 0.44,
                          title: '0.44%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 4:
                        return PieChartSectionData(
                          color: Colors.red,
                          value: 0.0,
                          title: '0.0%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 5:
                        return PieChartSectionData(
                          color: Colors.brown,
                          value: 0.0,
                          title: '0.0%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: '< 2.0 - (207)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: '2.1-4.0 - (16)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: '4.1-6 - (2)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: '6.1-8 - (1)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.red,
                  text: '8.1-10 - (0)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.brown,
                  text: '>10 - (0)',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget olddemographicsChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Demographics distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 261 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(5, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 33.71,
                          title: '33.72%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 27.20,
                          title: '27.20%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 12.26,
                          title: '12.26%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 22.99,
                          title: '22.99%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 4:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 3.83,
                          title: '3.83%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: 'Bohol - 88',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: 'Sultan Kudarat - 71',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: 'Cebu - 32',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: 'Pangasinana - 60',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.red,
                  text: 'Pampanga - 10',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldownershipChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Land ownership distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 184 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(4, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 64.13,
                          title: '64.13%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 32.61,
                          title: '32.61%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 2.17,
                          title: '12.17',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 3:
                        return PieChartSectionData(
                          color: Colors.green,
                          value: 1.09,
                          title: '1.09%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: 'Owned - 118',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: 'Rented - 60',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: 'Partly owned and partly rented - 4',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.green,
                  text: 'Others(debt) - 2',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldemploymentChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Employment classification distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'out of 229 responses on the surveys:')
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: List.generate(3, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 25.0 : 16.0;
                    final radius = isTouched ? 60.0 : 50.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0:
                        return PieChartSectionData(
                          color: Colors.blue,
                          value: 61.57,
                          title: '61.57%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1:
                        return PieChartSectionData(
                          color: Colors.yellow,
                          value: 33.62,
                          title: '3.62%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 2:
                        return PieChartSectionData(
                          color: Colors.purple,
                          value: 4.80,
                          title: '4.80%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: 'FT no labor - 141',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: 'FT w/ labor - 77',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.purple,
                  text: 'Part time - 11',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      )
    ),
  );
  Widget oldPlantedChart() {
    // Create the list of ordinal data
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Corn', measure: 241),
      OrdinalData(domain: 'Rice', measure: 92),
      OrdinalData(domain: 'Banana', measure: 32),
      OrdinalData(domain: 'Coconut', measure: 31),
      OrdinalData(domain: 'Onion', measure: 21),
      OrdinalData(domain: 'Cassava', measure: 13),
      OrdinalData(domain: 'Eggplant', measure: 9),
      OrdinalData(domain: 'Vegetable', measure: 8),
      OrdinalData(domain: 'Coffee', measure: 7),
      OrdinalData(domain: 'Mango', measure: 7),
      OrdinalData(domain: 'Sweet potato', measure: 6),
      OrdinalData(domain: 'Mungbean', measure: 5),
      OrdinalData(domain: 'Cacao', measure: 4),
      OrdinalData(domain: 'High value crops', measure: 4),
      OrdinalData(domain: 'Pumpkin', measure: 4),
      OrdinalData(domain: 'Sitao', measure: 4),
      OrdinalData(domain: 'Ampalaya', measure: 3),
      OrdinalData(domain: 'Tomato', measure: 3),
      OrdinalData(domain: 'Chili pepper', measure: 3),
      OrdinalData(domain: 'Upo', measure: 3),
      OrdinalData(domain: 'Alugbati', measure: 2),
      OrdinalData(domain: 'Lubi', measure: 2),
      OrdinalData(domain: 'Mani', measure: 2),
      OrdinalData(domain: 'Okra', measure: 2),
      OrdinalData(domain: 'Fruits', measure: 2),
      OrdinalData(domain: 'Tobacco', measure: 2),
      OrdinalData(domain: 'Ube', measure: 2),
      OrdinalData(domain: 'Beans', measure: 1),
      OrdinalData(domain: 'Durian', measure: 1),
      OrdinalData(domain: 'Lanzones', measure: 1),
      OrdinalData(domain: 'Mahogany', measure: 1),
      OrdinalData(domain: 'Palm', measure: 1),
      OrdinalData(domain: 'Patola', measure: 1),
      OrdinalData(domain: 'Petsay', measure: 1),
      OrdinalData(domain: 'Potato', measure: 1),
      OrdinalData(domain: 'Rambutan', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Crops',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Crops planted by corn growers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 241 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget providerChart() {
    // Create the list of ordinal data for providers
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'LGU/National government', measure: 352),
      OrdinalData(domain: 'NGO', measure: 2),
      OrdinalData(domain: 'Private sector', measure: 2),
      OrdinalData(domain: 'Others', measure: 2),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Providers',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Providers of agricultural programs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 219 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget farminputChart() {
    List<OrdinalData> farmInputOrdinalList = [
      OrdinalData(domain: 'Seed', measure: 241),
      OrdinalData(domain: 'Fertilizer', measure: 92),
      OrdinalData(domain: 'Financial', measure: 32),
      OrdinalData(domain: 'Flood', measure: 31),
      OrdinalData(domain: 'Equipment', measure: 21),
      OrdinalData(domain: 'Training', measure: 13),
      OrdinalData(domain: 'Crop Insurance', measure: 9),
      OrdinalData(domain: 'Insecticide', measure: 8),
      OrdinalData(domain: 'Farm Demo', measure: 7),
      OrdinalData(domain: 'Seminar', measure: 7),
    ];

    final farmInputOrdinalGroup = [
      OrdinalGroup(
        id: 'Farm Input',
        data: farmInputOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Farm Input Received from Agricultural Programs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 219 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: farmInputOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget hostChart() {
    List<OrdinalData> hostOrdinalList = [
      OrdinalData(domain: 'LGU/ National government', measure: 169),
      OrdinalData(domain: 'Private', measure: 13),
      OrdinalData(domain: 'NGO', measure: 3),
      OrdinalData(domain: 'Others', measure: 3),
    ];

    final hostOrdinalGroup = [
      OrdinalGroup(
        id: 'Host/Organizer',
        data: hostOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Host/Organizer of Agricultural Programs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Uncomment this line if you want to show the total responses
            // Padding(padding: const EdgeInsets.all(4.0), child: Text('out of 241 responses on the surveys:')),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: hostOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget programsChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Programs where the farmers surveyed are beneficiaries:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: const Center(child: Text('DA R12 Corn Program')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Corn and Cassava Program')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Flood')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Corn Production')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Farm demo')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Corn Resiliency Program')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Seed and fertilizer subsidy')),
                  ),
                  Container(
                    height: 40,
                    child: const Center(child: Text('Corn insurance')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget seminarsChart() => Container(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),child: Text(
              'Seminars attended by the surveyed farmers:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),
          // Padding(padding: const EdgeInsets.all(4.0),child: Text(
          //     'out of 241 responses on the surveys:')
          // ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: const Center(child: Text('Farmers field school')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Corn and Cassava Program')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('FSS on corn')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Corn Production')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Bagong teknolohiya sa pagmamais/pagpapalay')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Corn demo')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Corn Resiliency Program')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Agro enterprise clustering')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('All production training')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('GAP - Good agriculture practice')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Bantay peste (Fall armyworm)')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('All production training')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget pampangapreChart() {
    // Create the list of ordinal data for insecticides
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Prevathon', measure: 7),
      OrdinalData(domain: 'Magnum', measure: 5),
      OrdinalData(domain: 'Selectron', measure: 5),
      OrdinalData(domain: 'Kill', measure: 4),
      OrdinalData(domain: 'Regent', measure: 4),
      OrdinalData(domain: 'Seven', measure: 4),
      OrdinalData(domain: 'Brodan', measure: 2),
      OrdinalData(domain: 'Furadan', measure: 2),
      OrdinalData(domain: 'Mateh', measure: 1),
      OrdinalData(domain: 'Quadro', measure: 1),
      OrdinalData(domain: 'Resbak', measure: 1),
      OrdinalData(domain: 'Furamax', measure: 1),
      OrdinalData(domain: 'Hytox', measure: 1),
      OrdinalData(domain: 'Karate', measure: 1),
      OrdinalData(domain: 'Lannate', measure: 1),
      OrdinalData(domain: 'Machete', measure: 1),
      OrdinalData(domain: 'Onecide', measure: 1),
      OrdinalData(domain: 'Rimon', measure: 1),
      OrdinalData(domain: 'Solomon', measure: 1),
      OrdinalData(domain: 'Sumicidin', measure: 1),
      OrdinalData(domain: 'Super Insecticide', measure: 1),
      OrdinalData(domain: 'Bulldock', measure: 1),
      OrdinalData(domain: 'Cartap', measure: 1),
      OrdinalData(domain: 'Chix', measure: 1),
      OrdinalData(domain: 'Cymbush', measure: 1),
      OrdinalData(domain: 'Fenos', measure: 1),
      OrdinalData(domain: 'Leure', measure: 1),
      OrdinalData(domain: 'Exalt', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Pampanga (pre-2019)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 9 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget pangasinanpreChart() {
    // Create the list of ordinal data for insecticides
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Brodan', measure: 27),
      OrdinalData(domain: 'Lannate', measure: 27),
      OrdinalData(domain: 'Prevathon', measure: 20),
      OrdinalData(domain: 'Chix', measure: 20),
      OrdinalData(domain: 'Cartap', measure: 16),
      OrdinalData(domain: 'Malathion', measure: 16),
      OrdinalData(domain: 'Magnum', measure: 16),
      OrdinalData(domain: 'Ascend', measure: 15),
      OrdinalData(domain: 'Goal', measure: 15),
      OrdinalData(domain: 'Solomon', measure: 12),
      OrdinalData(domain: 'Furadan', measure: 12),
      OrdinalData(domain: 'Ronstar', measure: 11),
      OrdinalData(domain: 'Alika', measure: 10),
      OrdinalData(domain: 'Decis', measure: 10),
      OrdinalData(domain: 'Onecide', measure: 10),
      OrdinalData(domain: 'Seven', measure: 10),
      OrdinalData(domain: 'Cymbush', measure: 8),
      OrdinalData(domain: 'Machete', measure: 8),
      OrdinalData(domain: 'Regent', measure: 8),
      OrdinalData(domain: 'Score', measure: 8),
      OrdinalData(domain: 'Armor', measure: 6),
      OrdinalData(domain: 'Bulldock', measure: 6),
      OrdinalData(domain: 'Padan', measure: 6),
      OrdinalData(domain: 'Diethane', measure: 6),
      OrdinalData(domain: 'Parker Neem', measure: 6),
      OrdinalData(domain: 'Amate', measure: 5),
      OrdinalData(domain: 'Karate', measure: 5),
      OrdinalData(domain: 'Selectron', measure: 5),
      OrdinalData(domain: 'Trigard', measure: 4),
      OrdinalData(domain: 'Long Death', measure: 3),
      OrdinalData(domain: 'Thiodan', measure: 3),
      OrdinalData(domain: 'Super Insecticide', measure: 3),
      OrdinalData(domain: 'Surekill', measure: 3),
      OrdinalData(domain: 'Atabron', measure: 3),
      OrdinalData(domain: 'Kriss', measure: 3),
      OrdinalData(domain: 'TKO', measure: 3),
      OrdinalData(domain: 'Furamax', measure: 3),
      OrdinalData(domain: 'Agrimek', measure: 2),
      OrdinalData(domain: 'Nuvacron', measure: 2),
      OrdinalData(domain: 'Ratkiller', measure: 2),
      OrdinalData(domain: 'Amistar', measure: 2),
      OrdinalData(domain: 'Fenos', measure: 2),
      OrdinalData(domain: 'Perfekthion', measure: 2),
      OrdinalData(domain: 'Boomflower', measure: 2),
      OrdinalData(domain: 'Aztron', measure: 2),
      OrdinalData(domain: 'Kill', measure: 2),
      OrdinalData(domain: 'Boxer', measure: 1),
      OrdinalData(domain: 'Proven', measure: 1),
      OrdinalData(domain: 'Racumin', measure: 1),
      OrdinalData(domain: 'Rampage', measure: 1),
      OrdinalData(domain: 'Sumicidin', measure: 1),
      OrdinalData(domain: 'Insect kill', measure: 1),
      OrdinalData(domain: 'Antrakol', measure: 1),
      OrdinalData(domain: 'Brassinollide', measure: 1),
      OrdinalData(domain: 'Butterfly', measure: 1),
      OrdinalData(domain: 'Success', measure: 1),
      OrdinalData(domain: 'Exalt', measure: 1),
      OrdinalData(domain: 'Chlorfen', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Pangasinan (pre-2019)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 57 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget boholpreChart() {
    // Create the list of ordinal data for insecticides
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Lannate', measure: 20),
      OrdinalData(domain: 'Karate', measure: 11),
      OrdinalData(domain: 'Cartap', measure: 9),
      OrdinalData(domain: 'Brodan', measure: 7),
      OrdinalData(domain: 'Malathion', measure: 7),
      OrdinalData(domain: 'Armor', measure: 5),
      OrdinalData(domain: 'Chix', measure: 5),
      OrdinalData(domain: 'Furadan', measure: 5),
      OrdinalData(domain: 'Agrimek', measure: 4),
      OrdinalData(domain: 'Decis', measure: 3),
      OrdinalData(domain: 'Cymbush', measure: 3),
      OrdinalData(domain: 'Seven', measure: 2),
      OrdinalData(domain: 'Diethane', measure: 2),
      OrdinalData(domain: 'Alika', measure: 1),
      OrdinalData(domain: 'Carbopen', measure: 1),
      OrdinalData(domain: 'Redeem', measure: 1),
      OrdinalData(domain: 'Padan', measure: 1),
      OrdinalData(domain: 'Insect kill', measure: 1),
      OrdinalData(domain: 'Killer', measure: 1),
      OrdinalData(domain: 'Magnum', measure: 1),
      OrdinalData(domain: 'Rampage', measure: 1),
      OrdinalData(domain: 'Solomon', measure: 1),
      OrdinalData(domain: 'Thiodan', measure: 1),
      OrdinalData(domain: 'Surekill', measure: 1),
      OrdinalData(domain: 'Hytox', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Bohol (pre-2019)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 29 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget cebupreChart() {
    // Create the ordinal data list
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Lannate', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Cebu (pre-2019)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 1 response on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget skpreChart() {
    // Create the ordinal data list
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Lannate', measure: 36),
      OrdinalData(domain: 'Cartap', measure: 26),
      OrdinalData(domain: 'Padan', measure: 26),
      OrdinalData(domain: 'Aztron', measure: 24),
      OrdinalData(domain: 'Chix', measure: 23),
      OrdinalData(domain: 'Furadan', measure: 23),
      OrdinalData(domain: 'Malathion', measure: 22),
      OrdinalData(domain: 'Solomon', measure: 21),
      OrdinalData(domain: 'Brodan', measure: 19),
      OrdinalData(domain: 'Prevathon', measure: 18),
      OrdinalData(domain: 'Magnum', measure: 17),
      OrdinalData(domain: 'Score', measure: 15),
      OrdinalData(domain: 'Cymbush', measure: 14),
      OrdinalData(domain: 'Karate', measure: 12),
      OrdinalData(domain: 'Ronstar', measure: 8),
      OrdinalData(domain: 'Machete', measure: 7),
      OrdinalData(domain: 'Regent', measure: 7),
      OrdinalData(domain: 'Seven', measure: 6),
      OrdinalData(domain: 'Proven', measure: 5),
      OrdinalData(domain: 'Ascend', measure: 4),
      OrdinalData(domain: 'Alika', measure: 3),
      OrdinalData(domain: 'Armor', measure: 3),
      OrdinalData(domain: 'Racumin', measure: 3),
      OrdinalData(domain: 'Surekill', measure: 3),
      OrdinalData(domain: 'Antrakol', measure: 2),
      OrdinalData(domain: 'Creolina', measure: 2),
      OrdinalData(domain: 'Diethane', measure: 2),
      OrdinalData(domain: 'Hytox', measure: 2),
      OrdinalData(domain: 'Attack', measure: 1),
      OrdinalData(domain: 'Decis', measure: 1),
      OrdinalData(domain: 'Virtako', measure: 1),
      OrdinalData(domain: 'Condo', measure: 1),
      OrdinalData(domain: 'Condor', measure: 1),
      OrdinalData(domain: 'Furamax', measure: 1),
      OrdinalData(domain: 'Onecide', measure: 1),
      OrdinalData(domain: 'Nuvacron', measure: 1),
      OrdinalData(domain: 'Killer', measure: 1),
      OrdinalData(domain: 'Panlaban', measure: 1),
      OrdinalData(domain: 'Thiodan', measure: 1),
      OrdinalData(domain: 'Success', measure: 1),
      OrdinalData(domain: 'Ratkiller', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Sultan Kudarat (pre-2019)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 54 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget pampangapostChart() {
    // Create the ordinal data list
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Brodan', measure: 5),
      OrdinalData(domain: 'Prevathon', measure: 5),
      OrdinalData(domain: 'Selectron', measure: 4),
      OrdinalData(domain: 'Kill', measure: 4),
      OrdinalData(domain: 'Furadan', measure: 3),
      OrdinalData(domain: 'Lannate', measure: 3),
      OrdinalData(domain: 'Alika', measure: 2),
      OrdinalData(domain: 'Cymbush', measure: 2),
      OrdinalData(domain: 'Bulldock', measure: 2),
      OrdinalData(domain: 'Karate', measure: 2),
      OrdinalData(domain: 'Magnum', measure: 2),
      OrdinalData(domain: 'Fenos', measure: 1),
      OrdinalData(domain: 'Seven', measure: 1),
      OrdinalData(domain: 'Cartap', measure: 1),
      OrdinalData(domain: 'Chix', measure: 1),
      OrdinalData(domain: 'Furamax', measure: 1),
      OrdinalData(domain: 'Machete', measure: 1),
      OrdinalData(domain: 'Malathion', measure: 1),
      OrdinalData(domain: 'Rimon', measure: 1),
      OrdinalData(domain: 'Sumicidin', measure: 1),
      OrdinalData(domain: 'Super Insecticide', measure: 1),
      OrdinalData(domain: 'Exalt', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Pampanga (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 9 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget pangasinanpostChart() {
    // Create the ordinal data list
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Brodan', measure: 24),
      OrdinalData(domain: 'Prevathon', measure: 18),
      OrdinalData(domain: 'Solomon', measure: 13),
      OrdinalData(domain: 'Lannate', measure: 13),
      OrdinalData(domain: 'Cartap', measure: 12),
      OrdinalData(domain: 'Malathion', measure: 12),
      OrdinalData(domain: 'Onecide', measure: 12),
      OrdinalData(domain: 'Goal', measure: 12),
      OrdinalData(domain: 'Parker Neem', measure: 12),
      OrdinalData(domain: 'Ronstar', measure: 11),
      OrdinalData(domain: 'Machete', measure: 10),
      OrdinalData(domain: 'Chix', measure: 10),
      OrdinalData(domain: 'Ascend', measure: 9),
      OrdinalData(domain: 'Magnum', measure: 9),
      OrdinalData(domain: 'Seven', measure: 9),
      OrdinalData(domain: 'Furadan', measure: 8),
      OrdinalData(domain: 'Benevia', measure: 7),
      OrdinalData(domain: 'Bulldock', measure: 7),
      OrdinalData(domain: 'Alika', measure: 6),
      OrdinalData(domain: 'Armor', measure: 5),
      OrdinalData(domain: 'Exalt', measure: 5),
      OrdinalData(domain: 'Karate', measure: 5),
      OrdinalData(domain: 'Score', measure: 5),
      OrdinalData(domain: 'Marshal', measure: 5),
      OrdinalData(domain: 'Kill', measure: 4),
      OrdinalData(domain: 'Diethane', measure: 4),
      OrdinalData(domain: 'Regent', measure: 4),
      OrdinalData(domain: 'Surekill', measure: 4),
      OrdinalData(domain: 'Perfekthion', measure: 4),
      OrdinalData(domain: 'Selectron', measure: 4),
      OrdinalData(domain: 'Amistar', measure: 3),
      OrdinalData(domain: 'Cymbush', measure: 3),
      OrdinalData(domain: 'Thiodan', measure: 3),
      OrdinalData(domain: 'Padan', measure: 3),
      OrdinalData(domain: 'Trigard', measure: 3),
      OrdinalData(domain: 'Amate', measure: 2),
      OrdinalData(domain: 'Yeoval', measure: 2),
      OrdinalData(domain: 'Decis', measure: 2),
      OrdinalData(domain: 'Long Death', measure: 2),
      OrdinalData(domain: 'Furamax', measure: 2),
      OrdinalData(domain: 'Super Insecticide', measure: 2),
      OrdinalData(domain: 'Virtako', measure: 2),
      OrdinalData(domain: 'Agrimek', measure: 1),
      OrdinalData(domain: 'Antrakol', measure: 1),
      OrdinalData(domain: 'Attack', measure: 1),
      OrdinalData(domain: 'Aztron', measure: 1),
      OrdinalData(domain: 'Boomflower', measure: 1),
      OrdinalData(domain: 'Kriss', measure: 1),
      OrdinalData(domain: 'Atabron', measure: 1),
      OrdinalData(domain: 'Butterfly', measure: 1),
      OrdinalData(domain: 'Fenos', measure: 1),
      OrdinalData(domain: 'Condor', measure: 1),
      OrdinalData(domain: 'Molasses ferment', measure: 1),
      OrdinalData(domain: 'Panlaban', measure: 1),
      OrdinalData(domain: 'Hytox', measure: 1),
      OrdinalData(domain: 'Insect kill', measure: 1),
      OrdinalData(domain: 'Proven', measure: 1),
      OrdinalData(domain: 'Racumin', measure: 1),
      OrdinalData(domain: 'Rampage', measure: 1),
      OrdinalData(domain: 'Scorpop', measure: 1),
      OrdinalData(domain: 'TKO', measure: 1),
      OrdinalData(domain: 'Nuvacron', measure: 1),
      OrdinalData(domain: 'Tung-ho', measure: 1),
    ];

    // Define the ordinal group
    final ordinalGroup = [
      OrdinalGroup(
        id: 'Insecticides',
        data: ordinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Pangasinan (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Out of 50 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget boholpostChart() {
    List<OrdinalData> boholOrdinalList = [
      OrdinalData(domain: 'Virtako', measure: 15),
      OrdinalData(domain: 'Seven', measure: 14),
      OrdinalData(domain: 'Redeem', measure: 13),
      OrdinalData(domain: 'Parker Neem', measure: 10),
      OrdinalData(domain: 'Cartap', measure: 6),
      OrdinalData(domain: 'Lannate', measure: 6),
      OrdinalData(domain: 'Furadan', measure: 4),
      OrdinalData(domain: 'Karate', measure: 4),
      OrdinalData(domain: 'Padan', measure: 4),
      OrdinalData(domain: 'Armor', measure: 3),
      OrdinalData(domain: 'Chix', measure: 3),
      OrdinalData(domain: 'Diethane', measure: 2),
      OrdinalData(domain: 'Magnum', measure: 2),
      OrdinalData(domain: 'Agrimek', measure: 1),
      OrdinalData(domain: 'Aztron', measure: 1),
      OrdinalData(domain: 'Prevathon', measure: 1),
      OrdinalData(domain: 'Bulldock', measure: 1),
      OrdinalData(domain: 'Condor', measure: 1),
      OrdinalData(domain: 'Decis', measure: 1),
      OrdinalData(domain: 'Yeoval', measure: 1),
      OrdinalData(domain: 'Cymbush', measure: 1),
      OrdinalData(domain: 'Racumin', measure: 1),
      OrdinalData(domain: 'Rimon', measure: 1),
      OrdinalData(domain: 'Benevia', measure: 1),
      OrdinalData(domain: 'Selectron', measure: 1),
      OrdinalData(domain: 'Tami', measure: 1),
    ];

    final boholOrdinalGroup = [
      OrdinalGroup(
        id: 'Bohol',
        data: boholOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Bohol (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 33 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: boholOrdinalGroup
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget cebupostChart() {
    List<OrdinalData> cebuOrdinalList = [
      OrdinalData(domain: 'Lannate', measure: 7),
      OrdinalData(domain: 'Seven', measure: 5),
      OrdinalData(domain: 'Benefit', measure: 4),
      OrdinalData(domain: 'Malathion', measure: 3),
      OrdinalData(domain: 'Brodan', measure: 1),
      OrdinalData(domain: 'Exalt', measure: 1),
      OrdinalData(domain: 'Tag Team', measure: 1),
    ];

    final cebuOrdinalGroup = [
      OrdinalGroup(
        id: 'Cebu',
        data: cebuOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Cebu (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 17 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: cebuOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget skpostChart() {
    List<OrdinalData> skOrdinalList = [
      OrdinalData(domain: 'Brodan', measure: 29),
      OrdinalData(domain: 'Cartap', measure: 26),
      OrdinalData(domain: 'Aztron', measure: 25),
      OrdinalData(domain: 'Chix', measure: 18),
      OrdinalData(domain: 'Magnum', measure: 18),
      OrdinalData(domain: 'Malathion', measure: 18),
      OrdinalData(domain: 'Padan', measure: 16),
      OrdinalData(domain: 'Score', measure: 16),
      OrdinalData(domain: 'Furadan', measure: 15),
      OrdinalData(domain: 'Karate', measure: 15),
      OrdinalData(domain: 'Prevathon', measure: 15),
      OrdinalData(domain: 'Lannate', measure: 14),
      OrdinalData(domain: 'Solomon', measure: 13),
      OrdinalData(domain: 'Cymbush', measure: 12),
      OrdinalData(domain: 'Armor', measure: 8),
      OrdinalData(domain: 'Perfekthion', measure: 8),
      OrdinalData(domain: 'Racumin', measure: 7),
      OrdinalData(domain: 'Bulldock', measure: 6),
      OrdinalData(domain: 'Thiodan', measure: 6),
      OrdinalData(domain: 'Virtako', measure: 6),
      OrdinalData(domain: 'Ascend', measure: 5),
      OrdinalData(domain: 'Hytox', measure: 5),
      OrdinalData(domain: 'Regent', measure: 4),
      OrdinalData(domain: 'Alika', measure: 3),
      OrdinalData(domain: 'Machete', measure: 3),
      OrdinalData(domain: 'Ronstar', measure: 3),
      OrdinalData(domain: 'Ace clear', measure: 2),
      OrdinalData(domain: 'Carbopen', measure: 2),
      OrdinalData(domain: 'Surekill', measure: 2),
      OrdinalData(domain: 'Agrimek', measure: 1),
      OrdinalData(domain: 'Amistar', measure: 1),
      OrdinalData(domain: 'Antrakol', measure: 2),
      OrdinalData(domain: 'Attack', measure: 1),
      OrdinalData(domain: 'Boomflower', measure: 1),
      OrdinalData(domain: 'Bushwack', measure: 1),
      OrdinalData(domain: 'Butterfly', measure: 1),
      OrdinalData(domain: 'Decis', measure: 1),
      OrdinalData(domain: 'Diethane', measure: 1),
      OrdinalData(domain: 'Lure', measure: 1),
      OrdinalData(domain: 'Nuvacron', measure: 1),
      OrdinalData(domain: 'Seven', measure: 1),
      OrdinalData(domain: 'Success', measure: 1),
      OrdinalData(domain: 'Pyrozine', measure: 1),
    ];

    final skOrdinalGroup = [
      OrdinalGroup(
        id: 'Sultan Kudarat',
        data: skOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Insecticides used by corn growers in Sultan Kudarat (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 60 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: skOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

// Pampanga Household Items Chart
  Widget pampangaposthhChart() {
    List<OrdinalData> pampangaOrdinalList = [
      OrdinalData(domain: 'ariel', measure: 1),
      OrdinalData(domain: 'detergent', measure: 1),
      OrdinalData(domain: 'dishwashing liquid', measure: 1),
      OrdinalData(domain: 'iodized salt', measure: 1),
      OrdinalData(domain: 'asin (rock salt)', measure: 1),
      OrdinalData(domain: 'sugar', measure: 1),
      OrdinalData(domain: 'vetsin', measure: 1),
      OrdinalData(domain: 'vinegar', measure: 1),
      OrdinalData(domain: 'zonrox', measure: 1),
    ];

    final pampangaOrdinalGroup = [
      OrdinalGroup(
        id: 'Pampanga',
        data: pampangaOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Household items used by corn growers in Pampanga (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 1 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: pampangaOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

// Pangasinan Household Items Chart
  Widget pangasinanposthhChart() {
    List<OrdinalData> pangasinanOrdinalList = [
      OrdinalData(domain: 'dishwashing liquid', measure: 22),
      OrdinalData(domain: 'sugar', measure: 20),
      OrdinalData(domain: 'asin (rock salt)', measure: 19),
      OrdinalData(domain: 'vinegar', measure: 19),
      OrdinalData(domain: 'detergent', measure: 17),
      OrdinalData(domain: 'vetsin', measure: 16),
      OrdinalData(domain: 'zonrox', measure: 12),
      OrdinalData(domain: 'ariel', measure: 11),
      OrdinalData(domain: 'iodized salt', measure: 7),
      OrdinalData(domain: 'tuff', measure: 6),
      OrdinalData(domain: 'rat killer', measure: 6),
      OrdinalData(domain: '"butiki"', measure: 4),
      OrdinalData(domain: 'used cooking oil', measure: 2),
      OrdinalData(domain: 'gin ginebra', measure: 1),
    ];

    final pangasinanOrdinalGroup = [
      OrdinalGroup(
        id: 'Pangasinan',
        data: pangasinanOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Household items used by corn growers in Pangasinan (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 31 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: pangasinanOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

// Bohol Household Items Chart
  Widget boholposthhChart() {
    List<OrdinalData> boholOrdinalList = [
      OrdinalData(domain: 'iodized salt', measure: 2),
      OrdinalData(domain: 'vinegar', measure: 2),
      OrdinalData(domain: 'sugar', measure: 2),
      OrdinalData(domain: 'ariel', measure: 2),
      OrdinalData(domain: 'zonrox', measure: 1),
      OrdinalData(domain: 'dishwashing liquid', measure: 1),
      OrdinalData(domain: 'detergent', measure: 1),
      OrdinalData(domain: 'used cooking oil', measure: 1),
    ];

    final boholOrdinalGroup = [
      OrdinalGroup(
        id: 'Bohol',
        data: boholOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Household items used by corn growers in Bohol (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 7 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: boholOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

// Cebu Household Items Chart
  Widget cebuposthhChart() {
    List<OrdinalData> cebuOrdinalList = [
      OrdinalData(domain: 'detergent', measure: 2),
      OrdinalData(domain: 'dishwashing liquid', measure: 2),
      OrdinalData(domain: 'used cooking oil', measure: 1),
      OrdinalData(domain: 'sugar', measure: 1),
      OrdinalData(domain: 'vinegar', measure: 1),
      OrdinalData(domain: 'zonrox', measure: 1),
    ];

    final cebuOrdinalGroup = [
      OrdinalGroup(
        id: 'Cebu',
        data: cebuOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Household items used by corn growers in Cebu (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 6 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: cebuOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

// Sultan Kudarat Household Items Chart with hh
  Widget skposthhChart() {
    List<OrdinalData> skposthhOrdinalList = [
      OrdinalData(domain: 'Dishwashing liquid', measure: 30),
      OrdinalData(domain: 'Salt', measure: 28),
      OrdinalData(domain: 'Vinegar', measure: 25),
      OrdinalData(domain: 'Sugar', measure: 24),
      OrdinalData(domain: 'Detergent', measure: 22),
      OrdinalData(domain: 'zonrox', measure: 20),
      OrdinalData(domain: 'Ariel', measure: 18),
      OrdinalData(domain: 'Dishwashing soap', measure: 16),
      OrdinalData(domain: 'Rat killer', measure: 15),
    ];

    final skposthhOrdinalGroup = [
      OrdinalGroup(
        id: 'Sultan Kudarat Household Items',
        data: skposthhOrdinalList,
      ),
    ];

    return Container(
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Household items used by corn growers in Sultan Kudarat (2019 onwards)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('out of 30 responses on the surveys:'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: skposthhOrdinalGroup,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

