# 🎸 Guitar Haven - E-commerce UI Project

### 👤 Student Name & ID:
**Kiara Ragodo**  
**ID: 2024-26031**

---

## 🛒 Project Description

**Guitar Haven** is a guitar-focused e-commerce mobile application designed using Flutter. The app provides an immersive and easy-to-use platform for guitar enthusiasts to browse, explore, and shop for a curated selection of guitars. The concept centers around providing a visually rich and streamlined UI/UX experience tailored specifically for musicians and music lovers. 

This UI-focused application does not include backend integration but simulates a full e-commerce journey using mock data and state management.

---

## Implemented Features

### 1. **Splash & Home Screen**
- **Main Purpose**: Acts as the landing screen where users begin their shopping experience.
- **Key UI Elements**:
  - App logo 
  - Grid view of guitars with images, names, and prices
  - Bottom navigation bar for accessing Home, Cart, and Profile

### 2. **Product Detail Screen**
- **Main Purpose**: Allows users to view detailed information about a specific guitar.
- **Key UI Elements**:
  - High-resolution image carousel
  - Product name, price, and description
  - Dropdown/selector for color and size
  - Quantity selector (+/-)
  - Add to Cart button

### 3. **Cart Screen**
- **Main Purpose**: Displays the list of products the user has added to their cart.
- **Key UI Elements**:
  - Total price calculation
  - Checkout button

### 4. **Checkout Screen**
- **Main Purpose**: Final step of the shopping process.
- **Key UI Elements**:
  - Order summary
  - Static thank-you confirmation message

### 5. **Profile Screen**
- **Main Purpose**: Item deliveries to be receive.
- **Key UI Elements**:
  - List of Ordered items
  - Received button

### Additional Features
- Profile Screen- Where all deliveries can be seen and where the customer can notify the seller by clicking the received button
- State handling for cart management using `setState`
- Consistent bottom navigation across all main screens
- Color and size choice using `ChoiceChip` widgets
- Snackbar confirmation when adding to cart
- Clean layout with `MediaQuery`, `Expanded`, and `Flexible` for responsive design

---

## Unique Design Choices & Creativity

### Niche Focus
By targeting guitar enthusiasts, the app is uniquely tailored to a specific audience. Every design choice—from product layout to imagery—reflects the love for music and guitars.

### Color Palette
- Inspired by the **natural wooden tones** of guitars.
- **Dark Brown** (`#5D4037`) used for buttons and headers to represent mahogany/rosewood finishes.
- **Light Brown** (`#D7CCC8`) and **White** for backgrounds and contrast, giving the app a clean, organic look.

### Typography
- Bold sans-serif fonts for headers to command attention.
- Clean, readable fonts for body text to enhance user experience.

### Iconography & Branding
- Custom icons representing guitars, shopping carts, and user profiles
- Splash screen with a musical note icon on a black background for minimal, elegant branding

### Innovative UI/UX Touches
- Interactive product selectors for color, size, and quantity
- Fully responsive layout using `MediaQuery`
- Use of `PageView` for a clean image carousel
- Modular structure for better code reusability

---

## Challenges Faced & Solutions

### 1. **Showing the add to cart items to the Cart Screen**
- **Problem**: Managing cart state and product selections without persistent storage.
- **Solution**: Implemented an in-memory cart system using `CartService` and `setState()` for state updates. Structured the app to ensure UI consistently reflects the current state.

### 2. **UI Consistency on Different Devices**
- **Problem**: Ensuring that UI looks consistent across various screen sizes.
- **Solution**: Used `Flexible`, `Expanded`, and `MediaQuery` extensively to create responsive layouts. Spacing and padding were adjusted dynamically.

---

---

## Technologies Used

- **Flutter** for UI development
- **Dart** as programming language
- **Stateless & Stateful Widgets**
- **Custom Styles** with `ThemeData`, `TextStyle`, and `ButtonStyle`

