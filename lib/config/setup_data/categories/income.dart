import '../../../models/enums/transaction_types.dart';
import '../../../models/setup/setup_category.dart';

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

final incomeCategories = [
  _interestsDividends,
  _rentalIncome,
  _gifts,
  _lotteryGambling,
  _salary,
  _childSupport,
];
