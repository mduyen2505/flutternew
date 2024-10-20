import 'package:flutter/material.dart';

class Computer {
  final String name;
  final String imagePath;
  final double price;
  final double rate;
  final String description;
  final String review;
  final List<Color> colors;

  Computer({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.rate,
    required this.description,
    required this.review,
    required this.colors,
  });
}

// Dữ liệu giả
final List<Computer> computers = [
  Computer(
    name: 'MacBook Pro 14 M1 Max',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 2499,
    rate: 4.8,
    description:
        'The MacBook Pro 14 M1 Max is a powerhouse of a laptop designed for creative professionals and developers alike. Featuring Apple\'s M1 Max chip with up to 32 GPU cores, it delivers unmatched speed and efficiency for tasks such as video editing, 3D rendering, and software development. With up to 64GB of unified memory and 8TB of storage, this machine is built to handle the most demanding workflows. The stunning Liquid Retina XDR display with a 120Hz ProMotion refresh rate offers incredible color accuracy and detail, making it perfect for photographers, filmmakers, and graphic designers. Additionally, its all-day battery life ensures productivity on the go.',
    review: '(320 Reviews)',
    colors: [Colors.black, Color(0xFFC0C0C0)],
  ),
  Computer(
    name: 'Alienware m15 R6',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 2199,
    rate: 4.6,
    description:
        'The Alienware m15 R6 is a premium gaming laptop engineered to provide the best possible gaming experience. Powered by Intel\'s latest processors and NVIDIA GeForce RTX 3080 graphics, it offers lightning-fast performance and stunning ray-traced graphics. With a 15.6-inch QHD display and up to 360Hz refresh rate, gamers can enjoy ultra-smooth gameplay with high-resolution visuals. It also includes an advanced cooling system to ensure optimal performance during extended gaming sessions. Whether you\'re playing AAA titles or running VR applications, the m15 R6 has the power and speed to keep you ahead of the competition.',
    review: '(280 Reviews)',
    colors: [Colors.black, Colors.grey],
  ),
  Computer(
    name: 'MSI GS66 Stealth',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 1999,
    rate: 4.7,
    description:
        'The MSI GS66 Stealth is a sleek and powerful gaming laptop designed for gamers who value both performance and portability. It features a 10th Gen Intel Core i7 processor, NVIDIA RTX 3070 graphics, and a 240Hz display, making it ideal for competitive gaming and high-demand applications. Its minimalist design and thin form factor make it easy to carry, while the long-lasting battery ensures you can game or work for hours on end. In addition, the GS66 comes with Cooler Boost Trinity+ technology, keeping the device cool during intense gaming sessions. Whether you\'re streaming, working on creative projects, or gaming, this laptop is up to the task.',
    review: '(150 Reviews)',
    colors: [Colors.black],
  ),
  Computer(
    name: 'Dell XPS 15 9500',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 1899,
    rate: 4.5,
    description:
        'The Dell XPS 15 9500 is the ultimate laptop for creative professionals. Equipped with up to a 10th Gen Intel Core i9 processor, NVIDIA GTX 1650 Ti graphics, and a stunning 4K UHD+ InfinityEdge display, it offers superior performance for photo editing, video production, and graphic design. The near-borderless screen and wide color gamut provide breathtaking visuals, making it a joy to use for both work and entertainment. Additionally, the XPS 15 boasts a high-quality build with a carbon-fiber palm rest and diamond-cut edges, providing both durability and a premium look. With up to 32GB of RAM and 2TB SSD, you\'ll have plenty of power and storage to handle any project.',
    review: '(200 Reviews)',
    colors: [Color(0xFFC0C0C0), Colors.white],
  ),
  Computer(
    name: 'Razer Blade 15 Advanced',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 2499,
    rate: 4.4,
    description:
        'The Razer Blade 15 Advanced is known for being one of the most powerful gaming laptops on the market, featuring cutting-edge technology and a slim design. With options for the latest Intel processors and NVIDIA RTX 3080 graphics, it provides top-tier performance in a portable form factor. The Blade 15 Advanced comes with a 4K OLED display that offers vivid colors and deep blacks, perfect for gaming or content creation. It also features per-key RGB lighting powered by Razer Chroma, allowing you to customize your keyboard to match your gaming style. Whether you\'re editing videos, creating 3D models, or playing the latest games, the Razer Blade 15 Advanced can handle it all.',
    review: '(180 Reviews)',
    colors: [Colors.black, Colors.green],
  ),
  Computer(
    name: 'HP Spectre x360 14',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 1599,
    rate: 4.7,
    description:
        'The HP Spectre x360 14 is a versatile 2-in-1 laptop designed for both work and play. Its 11th Gen Intel Core i7 processor and Intel Iris Xe graphics deliver excellent performance for everyday tasks, while the 13.5-inch OLED touch display offers stunning visuals for streaming, design, and light gaming. With its 360-degree hinge, you can easily switch between laptop, tent, and tablet modes, making it perfect for presentations, note-taking, and entertainment on the go. The Spectre x360 14 also includes a built-in privacy screen, long battery life, and fast charging capabilities, making it one of the best options for business professionals and students alike.',
    review: '(120 Reviews)',
    colors: [Colors.blue, Color.fromARGB(255, 166, 154, 84)],
  ),
  Computer(
    name: 'Lenovo ThinkPad X1 Carbon Gen 9',
    imagePath: 'images/products/mbp14-m3-max-pro-spaceblack-select-202310.jpg',
    price: 1799,
    rate: 4.6,
    description:
        'The Lenovo ThinkPad X1 Carbon Gen 9 is a lightweight, durable business laptop with top-notch security features and a premium build. Powered by Intel\'s 11th Gen processors and Intel Iris Xe graphics, it delivers exceptional performance for business applications, multitasking, and light content creation. The X1 Carbon includes a brilliant 14-inch display, a legendary ThinkPad keyboard, and an array of ports for connectivity. Built with military-grade durability, this laptop can withstand tough conditions, making it ideal for on-the-go professionals. With up to 16 hours of battery life, you\'ll have more than enough power to get through your day without needing to recharge.',
    review: '(300 Reviews)',
    colors: [Colors.black],
  ),
];
