import 'package:flutter/material.dart';
import '../widgets/chart_widget.dart';
import '../utils/box_decoration_helper.dart';

class OrderSaleStats extends StatelessWidget {
  const OrderSaleStats({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    List<double> orderData = [2000, 4000, 3000, 6000, 3500, 5000];
    List<double> saleData = [3000, 4500, 2500, 7000, 3000, 6000];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecorationHelper.getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order and Sale Stats",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Chart
                Expanded(
                  child: SizedBox(
                    height: 130,
                    child: ChartWidget(
                      yValues: orderData,
                      xLabels: months,
                      showAxes: true,
                      fontSize: 9,
                    ),
                  ),
                ),

                // Divider
                Container(
                  width: 1,
                  height: 130,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  color: Colors.grey.withOpacity(0.3),
                ),

                // Sale Chart
                Expanded(
                  child: SizedBox(
                    height: 130,
                    child: ChartWidget(
                      yValues: saleData,
                      xLabels: months,
                      showAxes: true,
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}