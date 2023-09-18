import 'package:wherewithal/models/category.dart';
import 'package:wherewithal/models/enums/transaction_type.dart';

// TODO delete this when real data is added
class MockData {
  // categories
  static final foodDrinks = Category(
    id: 1,
    title: 'Food & Drinks',
    transactionType: TransactionType.expense,
    subcategories: [
      restaurants,
      barCafe,
      groceries,
    ],
  );
  static final housing = Category(
    id: 2,
    title: 'Housing',
    transactionType: TransactionType.expense,
    subcategories: [
      utilities,
      maintenanceRepairs,
      mortgage,
      propertyInsurance,
      rent,
      services,
    ],
  );

  // sub 1 categories
  // food & drinks
  static final restaurants = Sub1category(
    id: 1,
    title: 'Restaurants',
    transactionType: TransactionType.expense,
  );
  static final barCafe = Sub1category(
    id: 2,
    title: 'Bar, cafe',
    transactionType: TransactionType.expense,
  );
  static final groceries = Sub1category(
    id: 3,
    title: 'Groceries',
    transactionType: TransactionType.expense,
    subcategories: [
      healthy,
      unhealthy,
    ],
    budget: 150.0,
  );
  // housing
  static final utilities = Sub1category(
    id: 4,
    title: 'Utilities',
    transactionType: TransactionType.expense,
  );
  static final maintenanceRepairs = Sub1category(
    id: 5,
    title: 'Maintenance, repairs',
    transactionType: TransactionType.expense,
  );
  static final mortgage = Sub1category(
    id: 6,
    title: 'Mortgage',
    transactionType: TransactionType.expense,
  );
  static final propertyInsurance = Sub1category(
    id: 7,
    title: 'Property insurance',
    transactionType: TransactionType.expense,
  );
  static final rent = Sub1category(
    id: 8,
    title: 'Rent',
    transactionType: TransactionType.expense,
  );
  static final services = Sub1category(
    id: 9,
    title: 'Services',
    transactionType: TransactionType.expense,
  );

  // sub 2 categories
  // groceries
  static final healthy = Sub2category(
    id: 1,
    title: 'Healthy',
    transactionType: TransactionType.expense,
  );
  static final unhealthy = Sub2category(
    id: 2,
    title: 'Unhealthy',
    transactionType: TransactionType.expense,
  );

  static final expenseCategories = [
    foodDrinks,
    housing,
  ];
  static final incomeCategories = [];
}
