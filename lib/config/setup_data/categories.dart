import '../../models/enums/category_reasons.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/setup/setup_category.dart';

final _healthy = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Healthy',
  categoryReason: CategoryReasons.need.name,
);
final _unhealthy = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Unhealthy',
  categoryReason: CategoryReasons.want.name,
);

final _restaurants = SetupCategory(
  id: '',
  title: 'Restaurants',
  transactionType: TransactionTypes.expense.name,
  categoryReason: CategoryReasons.want.name,
);
final _barCafe = SetupCategory(
  id: '',
  title: 'Bar, cafe',
  transactionType: TransactionTypes.expense.name,
  categoryReason: CategoryReasons.want.name,
);
final _groceries = SetupCategory(
  id: '',
  title: 'Groceries',
  transactionType: TransactionTypes.expense.name,
  budget: 500.0,
  subcategories: _groceriesSubcategories,
);

final _utilities = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Utilities',
);
final _maintenanceRepairs = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Maintenance, repairs',
);
final _mortgage = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Mortgage',
);
final _propertyInsurance = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Property insurance',
);
final _rent = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Rent',
);
final _services = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Services',
);

final _groceriesSubcategories = [
  _healthy,
  _unhealthy,
];
final _foodDrinksSubcategories = [
  _restaurants,
  _barCafe,
  _groceries,
];
final _housingSubcategories = [
  _utilities,
  _maintenanceRepairs,
  _mortgage,
  _propertyInsurance,
  _rent,
  _services,
];

final _foodDrinks = SetupCategory(
  id: '',
  title: 'Food & Drinks',
  transactionType: TransactionTypes.expense.name,
  subcategories: _foodDrinksSubcategories,
);
final _housing = SetupCategory(
  id: '',
  title: 'Housing',
  transactionType: TransactionTypes.expense.name,
  categoryReason: CategoryReasons.need.name,
  subcategories: _housingSubcategories,
);

final _interestsDividends = SetupCategory(
  id: '',
  title: 'Interests, dividends',
  transactionType: TransactionTypes.income.name,
);
final _rentalIncome = SetupCategory(
  id: '',
  title: 'Rental income',
  transactionType: TransactionTypes.income.name,
);
final _gifts = SetupCategory(
  id: '',
  title: 'Gifts',
  transactionType: TransactionTypes.income.name,
);
final _lotteryGambling = SetupCategory(
  id: '',
  title: 'Lottery, gambling',
  transactionType: TransactionTypes.income.name,
);
final _salary = SetupCategory(
  id: '',
  title: 'Salary',
  transactionType: TransactionTypes.income.name,
);
final _childSupport = SetupCategory(
  id: '',
  title: 'Child support',
  transactionType: TransactionTypes.income.name,
);

final _expenseCategories = [
  _foodDrinks,
  _housing,
];
final _incomeCategories = [
  _interestsDividends,
  _rentalIncome,
  _gifts,
  _lotteryGambling,
  _salary,
  _childSupport,
];

final allSetupCategories = [
  ..._expenseCategories,
  ..._incomeCategories,
];
