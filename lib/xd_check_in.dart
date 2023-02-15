import 'package:flutter/material.dart';
import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:adobe_xd/pinned.dart';
import './xd_taskbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDCheckIn extends StatelessWidget {
  XDCheckIn({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 145.5, vertical: 48.5),
            child: SizedBox.expand(
                child:
                    // Adobe XD layer: 'screen' (shape)
                    SvgPicture.string(
              _svg_g4o9ha,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            )),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.0, 0.0),
                radius: 0.5,
                colors: [const Color(0xff241181), const Color(0xff26108b)],
                stops: [0.0, 1.0],
                transform: GradientXDTransform(
                    1.0, 0.0, 0.0, 1.0, 0.0, 0.0, Alignment(0.0, 0.0)),
              ),
              borderRadius: BorderRadius.circular(90.0),
            ),
            margin: EdgeInsets.fromLTRB(145.0, 48.0, 145.0, 49.0),
          ),
          Pinned.fromPins(
            Pin(size: 650.0, middle: 0.5231),
            Pin(size: 40.0, start: 66.0),
            child:
                // Adobe XD layer: 'status bar' (group)
                Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(1.0, 0.1),
                  child: SizedBox(
                    width: 42.0,
                    height: 20.0,
                    child:
                        // Adobe XD layer: 'battery' (group)
                        Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 3.0,
                            height: 8.0,
                            child:
                                // Adobe XD layer: 'Tip' (shape)
                                SvgPicture.string(
                              _svg_qcsiz3,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 31.0, start: 3.0),
                          Pin(start: 4.0, end: 4.0),
                          child:
                              // Adobe XD layer: 'Fill' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                          ),
                        ),
                        // Adobe XD layer: 'Outline' (shape)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            border: Border.all(
                                width: 1.0, color: const Color(0x66ffffff)),
                          ),
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 32.0, end: 92.0),
                  Pin(size: 20.0, middle: 0.55),
                  child:
                      // Adobe XD layer: 'radian' (shape)
                      SvgPicture.string(
                    _svg_pbfv0o,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 55.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '9:41',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 30,
                      color: const Color(0xffffffff),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, end: 54.0),
                  Pin(size: 20.0, middle: 0.55),
                  child:
                      // Adobe XD layer: 'wifi' (shape)
                      SvgPicture.string(
                    _svg_ehzx80,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 424.0, middle: 0.4854),
            Pin(size: 57.0, start: 48.0),
            child:
                // Adobe XD layer: 'camera' (group)
                Stack(
              children: <Widget>[
                // Adobe XD layer: 'bg' (shape)
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff141414),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.423, -0.371),
                  child:
                      // Adobe XD layer: 'camera' (shape)
                      Container(
                    width: 22.0,
                    height: 22.0,
                    decoration: BoxDecoration(
                      color: const Color(0xfff0f3f6),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.003, -0.289),
                  child:
                      // Adobe XD layer: 'volume' (shape)
                      Container(
                    width: 105.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: const Color(0xfff0f3f6),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 332.0, middle: 0.4873),
            Pin(size: 93.0, start: 141.0),
            child: Text(
              'LookOut',
              style: TextStyle(
                fontFamily: 'Arial Rounded MT',
                fontSize: 80,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.fromLTRB(161.0, 279.0, 160.0, 217.0),
          ),
          Pinned.fromPins(
            Pin(start: 166.0, end: 165.0),
            Pin(size: 127.0, end: 63.0),
            child:
                // Adobe XD layer: 'Taskbar' (component)
                XDTaskbar(),
          ),
          Align(
            alignment: Alignment(0.003, -0.531),
            child: SizedBox(
              width: 683.0,
              height: 146.0,
              child:
                  // Adobe XD layer: 'Time' (group)
                  Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_kw30,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Pinned.fromPins(
                    Pin(start: 21.0, end: 20.0),
                    Pin(size: 34.0, middle: 0.875),
                    child: Text(
                      'Thanksgiving Party | Ends at 11:00',
                      style: TextStyle(
                        fontFamily: 'Microsoft Sans Serif',
                        fontSize: 30,
                        color: const Color(0xffe7f0ff),
                        height: 0.5333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 21.0, end: 20.0),
                    Pin(size: 53.0, middle: 0.3118),
                    child: Text(
                      '7 min until Check In',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.96,
                        height: 0.7,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(198.0, 775.0),
            child: Text(
              'Pin:',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 40,
                color: const Color(0xff22c5e6),
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Container(),
          Pinned.fromPins(
            Pin(size: 696.0, middle: 0.5),
            Pin(size: 414.0, end: 241.0),
            child: Stack(
              children: <Widget>[
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 210.0,
                    height: 87.0,
                    child: Stack(
                      children: <Widget>[
                        Container(),
                        Center(
                          child: SizedBox(
                            width: 62.0,
                            height: 37.0,
                            child:
                                // Adobe XD layer: 'Icon awesome-backsp…' (shape)
                                SvgPicture.string(
                              _svg_kew8cs,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_g4o9ha =
    '<svg viewBox="145.5 48.5 749.0 1623.0" ><path transform="translate(145.0, 48.0)" d="M 90 0.5 L 660 0.5 C 709.4295043945312 0.5 749.5 40.57051467895508 749.5 90 L 749.5 1534 C 749.5 1583.429443359375 709.4295043945312 1623.5 660 1623.5 L 90 1623.5 C 40.57051467895508 1623.5 0.5 1583.429443359375 0.5 1534 L 0.5 90 C 0.5 40.57051467895508 40.57051467895508 0.5 90 0.5 Z" fill="#0f0f0f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qcsiz3 =
    '<svg viewBox="395.0 -1.0 3.0 7.7" ><path transform="translate(372.0, -4.5)" d="M 23.00000190734863 3.499999761581421 C 24.7252311706543 3.944043397903442 26.00000190734863 5.510146141052246 26.00000190734863 7.373988151550293 C 26.00000190734863 9.237829208374023 24.7252311706543 10.80393123626709 23.00000190734863 11.24797630310059 L 23.00000190734863 3.499999761581421 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pbfv0o =
    '<svg viewBox="5546.0 278.0 32.0 20.0" ><path transform="translate(5546.0, 277.0)" d="M 27 18.50040054321289 L 27 3.500100135803223 C 27 2.119500160217285 28.11960029602051 0.9999000430107117 29.50020027160645 0.9999000430107117 C 30.88080024719238 0.9999000430107117 32.00040054321289 2.119500160217285 32.00040054321289 3.500100135803223 L 32.00040054321289 18.50040054321289 C 32.00040054321289 19.88100051879883 30.88080024719238 20.99970054626465 29.50020027160645 20.99970054626465 C 28.11960029602051 20.99970054626465 27 19.88100051879883 27 18.50040054321289 Z M 18 18.50040054321289 L 18 8.499600410461426 C 18 7.11899995803833 19.11960029602051 6.00029993057251 20.50020027160645 6.00029993057251 C 21.88080024719238 6.00029993057251 23.00040054321289 7.11899995803833 23.00040054321289 8.499600410461426 L 23.00040054321289 18.50040054321289 C 23.00040054321289 19.88100051879883 21.88080024719238 20.99970054626465 20.50020027160645 20.99970054626465 C 19.11960029602051 20.99970054626465 18 19.88100051879883 18 18.50040054321289 Z M 9 18.50040054321289 L 9 12.50010013580322 C 9 11.11950016021729 10.11960029602051 9.999899864196777 11.50020027160645 9.999899864196777 C 12.88080024719238 9.999899864196777 14.00040054321289 11.11950016021729 14.00040054321289 12.50010013580322 L 14.00040054321289 18.50040054321289 C 14.00040054321289 19.88100051879883 12.88080024719238 20.99970054626465 11.50020027160645 20.99970054626465 C 10.11960029602051 20.99970054626465 9 19.88100051879883 9 18.50040054321289 Z M 0 18.50040054321289 L 0 16.49970054626465 C 0 15.11910057067871 1.119600057601929 14.00040054321289 2.500200033187866 14.00040054321289 C 3.880800008773804 14.00040054321289 5.000400066375732 15.11910057067871 5.000400066375732 16.49970054626465 L 5.000400066375732 18.50040054321289 C 5.000400066375732 19.88100051879883 3.880800008773804 20.99970054626465 2.500200033187866 20.99970054626465 C 1.119600057601929 20.99970054626465 0 19.88100051879883 0 18.50040054321289 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ehzx80 =
    '<svg viewBox="5590.0 278.0 26.0 20.0" ><path transform="translate(11612.2, 501.83)" d="M -6011.009765625 -204.5708923339844 C -6012.0087890625 -205.5537261962891 -6012.0087890625 -207.1480255126953 -6011.009765625 -208.130859375 C -6010.01171875 -209.1136932373047 -6008.3896484375 -209.1136932373047 -6007.39111328125 -208.130859375 C -6006.392578125 -207.1480255126953 -6006.392578125 -205.5537261962891 -6007.39111328125 -204.5708923339844 C -6007.89111328125 -204.0794830322266 -6008.5458984375 -203.8337707519531 -6009.2001953125 -203.8337707519531 C -6009.85546875 -203.8337707519531 -6010.5107421875 -204.0794830322266 -6011.009765625 -204.5708923339844 Z M -6005.73828125 -209.7594757080078 C -6006.66259765625 -210.6692199707031 -6007.89306640625 -211.1703338623047 -6009.2001953125 -211.1703338623047 C -6010.5087890625 -211.1703338623047 -6011.73876953125 -210.6692199707031 -6012.6630859375 -209.7594757080078 C -6013.24853515625 -209.1837921142578 -6014.19580078125 -209.1837921142578 -6014.78076171875 -209.7594757080078 C -6015.3671875 -210.3351440429688 -6015.3671875 -211.2672729492188 -6014.78076171875 -211.8429412841797 C -6013.291015625 -213.3104858398438 -6011.30859375 -214.1188201904297 -6009.2001953125 -214.1188201904297 C -6007.0927734375 -214.1188201904297 -6005.1103515625 -213.3104858398438 -6003.62060546875 -211.8429412841797 C -6003.0361328125 -211.2672729492188 -6003.0361328125 -210.3351440429688 -6003.62060546875 -209.7594757080078 C -6003.9130859375 -209.4716339111328 -6004.29541015625 -209.3269653320312 -6004.67822265625 -209.3269653320312 C -6005.060546875 -209.3269653320312 -6005.4453125 -209.4716339111328 -6005.73828125 -209.7594757080078 Z M -6002.251953125 -213.1911773681641 C -6004.107421875 -215.0181274414062 -6006.57568359375 -216.0233306884766 -6009.2001953125 -216.0233306884766 C -6011.82568359375 -216.0233306884766 -6014.2939453125 -215.0181274414062 -6016.15087890625 -213.1911773681641 C -6016.73388671875 -212.6154937744141 -6017.6826171875 -212.6154937744141 -6018.267578125 -213.1911773681641 C -6018.8525390625 -213.7653656005859 -6018.8525390625 -214.698974609375 -6018.267578125 -215.2746429443359 C -6015.84619140625 -217.6578979492188 -6012.6259765625 -218.9703216552734 -6009.2001953125 -218.9703216552734 C -6005.7744140625 -218.9703216552734 -6002.55517578125 -217.6578979492188 -6000.13330078125 -215.2746429443359 C -5999.54833984375 -214.698974609375 -5999.54833984375 -213.7653656005859 -6000.13330078125 -213.1911773681641 C -6000.42578125 -212.9033355712891 -6000.80908203125 -212.7586669921875 -6001.193359375 -212.7586669921875 C -6001.57470703125 -212.7586669921875 -6001.95849609375 -212.9033355712891 -6002.251953125 -213.1911773681641 Z M -5998.7578125 -216.6288299560547 C -6001.5458984375 -219.3744964599609 -6005.255859375 -220.8867797851562 -6009.2001953125 -220.8867797851562 C -6013.1455078125 -220.8867797851562 -6016.85498046875 -219.3744964599609 -6019.6455078125 -216.6288299560547 C -6019.9365234375 -216.3410034179688 -6020.32080078125 -216.1978149414062 -6020.703125 -216.1978149414062 C -6021.08642578125 -216.1978149414062 -6021.47021484375 -216.3410034179688 -6021.76220703125 -216.6288299560547 C -6022.34765625 -217.2045135498047 -6022.34765625 -218.1381225585938 -6021.76220703125 -218.7138061523438 C -6018.4072265625 -222.0157623291016 -6013.947265625 -223.8337707519531 -6009.2001953125 -223.8337707519531 C -6004.45458984375 -223.8337707519531 -5999.994140625 -222.0157623291016 -5996.63916015625 -218.7138061523438 C -5996.0556640625 -218.1381225585938 -5996.0556640625 -217.2045135498047 -5996.640625 -216.6288299560547 C -5996.93310546875 -216.3415374755859 -5997.31689453125 -216.1976165771484 -5997.69970703125 -216.1976470947266 C -5998.08251953125 -216.1976623535156 -5998.46533203125 -216.3412017822266 -5998.7578125 -216.6288299560547 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kw30 =
    '<svg viewBox="0.0 0.2 683.0 146.0" ><path transform="translate(0.0, 0.2)" d="M 20 0 L 663 0 C 674.0457153320312 0 683 8.954304695129395 683 20 L 683 126 C 683 137.0457000732422 674.0457153320312 146 663 146 L 20 146 C 8.954304695129395 146 0 137.0457000732422 0 126 L 0 20 C 0 8.954304695129395 8.954304695129395 0 20 0 Z" fill="#2bd4c1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kew8cs =
    '<svg viewBox="732.0 1181.9 62.0 37.2" ><path transform="translate(732.0, 1177.4)" d="M 55.80013656616211 4.5 L 19.88469696044922 4.5 C 18.23881530761719 4.499998569488525 16.66161918640137 5.153757095336914 15.49926090240479 6.317280292510986 L 0.9078515768051147 20.90771865844727 C -0.3030859529972076 22.11865615844727 -0.3030859529972076 24.08134460449219 0.9078515768051147 25.29131317138672 L 15.50013256072998 39.88359451293945 C 16.66263389587402 41.04609298706055 18.23975944519043 41.70000076293945 19.88372802734375 41.70000076293945 L 55.80013656616211 41.70000076293945 C 59.22466659545898 41.70000076293945 62.0001335144043 38.92453002929688 62.0001335144043 35.5 L 62.0001335144043 10.69999980926514 C 62.0001335144043 7.275468349456787 59.22466659545898 4.5 55.80013656616211 4.5 Z M 47.59579086303711 29.11206245422363 C 48.20125961303711 29.71753120422363 48.20125961303711 30.69887542724609 47.59579086303711 31.30434417724609 L 45.40447616577148 33.49565505981445 C 44.79900741577148 34.10112380981445 43.81766510009766 34.10112380981445 43.21219635009766 33.49565505981445 L 37.20013427734375 27.48359298706055 L 31.18807220458984 33.49565505981445 C 30.58260345458984 34.10112380981445 29.60125923156738 34.10112380981445 28.99579048156738 33.49565505981445 L 26.80447769165039 31.30434417724609 C 26.19900894165039 30.69887542724609 26.19900894165039 29.71753120422363 26.80447769165039 29.11206245422363 L 32.8165397644043 23.10000038146973 L 26.80447769165039 17.08793640136719 C 26.19900894165039 16.48246765136719 26.19900894165039 15.50112342834473 26.80447769165039 14.89565467834473 L 28.99579048156738 12.70434284210205 C 29.60125923156738 12.09887409210205 30.58260345458984 12.09887409210205 31.18807220458984 12.70434284210205 L 37.20013427734375 18.71640586853027 L 43.21219635009766 12.70434284210205 C 43.81766510009766 12.09887409210205 44.79900741577148 12.09887409210205 45.40447616577148 12.70434284210205 L 47.59579086303711 14.89565467834473 C 48.20125961303711 15.50112342834473 48.20125961303711 16.48246765136719 47.59579086303711 17.08793640136719 L 41.5837287902832 23.10000038146973 L 47.59579086303711 29.11206245422363 Z" fill="#f5f5f5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
