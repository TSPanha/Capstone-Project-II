import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make payment to confirm your appointment with your doctor.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with your image URL
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Video Consultation',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dr. Frank Ufodu,\nGeneral Doctor, Higsory Specialist Hospitals.\nToday, 12:30pm (30mins)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Text('ORDER SUMMARY', style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Primary Care Visit Fee\nwith Dr. Frank Ufodu\n22nd Wed, June, 2022 at 12:30 PM\nCAT'),
                Text('\$700'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount'),
                Text('\$0.00'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$700',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Add promo code action
              },
              child: Text(
                '+ Add Promo Code',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                // Add insurance action
              },
              child: Text(
                '+ Add Insurance',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text('Select Payment Method', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Card Holder\'s Name',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Card Expiration (MM/YY)',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // PayPal action
                  },
                  child: Text('PayPal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Google Pay action
                  },
                  child: Text('Google Pay'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Apple Pay action
                  },
                  child: Text('Apple Pay'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
