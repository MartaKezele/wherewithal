import '../../../models/enums/category_reasons.dart';
import '../../../models/enums/transaction_types.dart';
import '../../../models/setup/setup_category.dart';

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
  title: 'Restaurant',
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

final _fuel = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Fuel',
);
final _leasing = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Leasing',
);
final _parking = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Parking',
);
final _vehicleInsurance = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Vehicle insurance',
);
final _vehicleMaintenance = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Vehicle maintenance',
);

final _publicTransport = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Public transport',
);
final _taxi = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Taxi',
);
final _vehicle = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Vehicle',
  subcategories: _vehicleSubcategories,
);

final _tvStreaming = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'TV, streaming',
);
final _appSubscriptions = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'App subscriptions',
);
final _games = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Games',
);
final _books = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Books',
);
final _events = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Events',
);
final _lotteryGambling = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Lottery, gambling',
);

final _accomodation = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Accomodation',
);
final _travelTransportation = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Transportation',
);
final _travelFoodDrinks = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Food & Drinks',
);
final _souvenirs = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Souvenirs',
);
final _travelEntertainment = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Entertainment',
);

final _doctorCheckups = SetupCategory(
  id: '',
  title: 'Doctor checkups',
  transactionType: TransactionTypes.expense.name,
);
final _medication = SetupCategory(
  id: '',
  title: 'Medication',
  transactionType: TransactionTypes.expense.name,
);
final _labTests = SetupCategory(
  id: '',
  title: 'Lab tests',
  transactionType: TransactionTypes.expense.name,
);
final _dentist = SetupCategory(
  id: '',
  title: 'Dentist',
  transactionType: TransactionTypes.expense.name,
);
final _psyhologicalSupport = SetupCategory(
  id: '',
  title: 'Psyhological support',
  transactionType: TransactionTypes.expense.name,
);
final _healthcareInsurance = SetupCategory(
  id: '',
  title: 'Healthcare insurance',
  transactionType: TransactionTypes.expense.name,
);

final _fines = SetupCategory(
  id: '',
  title: 'Fines',
  categoryReason: CategoryReasons.need.name,
  transactionType: TransactionTypes.expense.name,
);
final _taxes = SetupCategory(
  id: '',
  title: 'Taxes',
  categoryReason: CategoryReasons.need.name,
  transactionType: TransactionTypes.expense.name,
);
final _advisory = SetupCategory(
  id: '',
  title: 'Advisory',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
);
final _childSupport = SetupCategory(
  id: '',
  title: 'Child support',
  categoryReason: CategoryReasons.need.name,
  transactionType: TransactionTypes.expense.name,
);

final _stocks = SetupCategory(
  id: '',
  title: 'Stocks',
  transactionType: TransactionTypes.expense.name,
);
final _indexFunds = SetupCategory(
  id: '',
  title: 'Index funds',
  transactionType: TransactionTypes.expense.name,
);
final _preciousMetals = SetupCategory(
  id: '',
  title: 'Precious metals',
  transactionType: TransactionTypes.expense.name,
);
final _crypto = SetupCategory(
  id: '',
  title: 'Crypto',
  transactionType: TransactionTypes.expense.name,
);
final _pensionPayments = SetupCategory(
  id: '',
  title: 'Pension payments',
  transactionType: TransactionTypes.expense.name,
);

final _petFood = SetupCategory(
  id: '',
  title: 'Food',
  transactionType: TransactionTypes.expense.name,
);
final _petToys = SetupCategory(
  id: '',
  title: 'Toys',
  transactionType: TransactionTypes.expense.name,
);
final _petClothesAccessories = SetupCategory(
  id: '',
  title: 'Clothes & Accessories',
  transactionType: TransactionTypes.expense.name,
);
final _vetCheckups = SetupCategory(
  id: '',
  title: 'Vet checkups',
  transactionType: TransactionTypes.expense.name,
);
final _petCareProducts = SetupCategory(
  id: '',
  title: 'Care products',
  transactionType: TransactionTypes.expense.name,
);

final _clothes = SetupCategory(
  id: '',
  title: 'Clothes',
  transactionType: TransactionTypes.expense.name,
);
final _sportClothesEquipment = SetupCategory(
  id: '',
  title: 'Sport clothes & equipment',
  transactionType: TransactionTypes.expense.name,
);
final _shoes = SetupCategory(
  id: '',
  title: 'Shoes',
  transactionType: TransactionTypes.expense.name,
);
final _bags = SetupCategory(
  id: '',
  title: 'Bags',
  transactionType: TransactionTypes.expense.name,
);
final _accessories = SetupCategory(
  id: '',
  title: 'Accessories',
  transactionType: TransactionTypes.expense.name,
);
final _jewlery = SetupCategory(
  id: '',
  title: 'Jewlery',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
);
final _cosmetics = SetupCategory(
  id: '',
  title: 'Cosmetics',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
);
final _hygineProducts = SetupCategory(
  id: '',
  title: 'Hygine products',
  transactionType: TransactionTypes.expense.name,
);
final _cleaning = SetupCategory(
  id: '',
  title: 'Cleaning',
  categoryReason: CategoryReasons.need.name,
  transactionType: TransactionTypes.expense.name,
);
final _homeGarden = SetupCategory(
  id: '',
  title: 'Home, garden',
  transactionType: TransactionTypes.expense.name,
);
final _pets = SetupCategory(
  id: '',
  title: 'Pets',
  transactionType: TransactionTypes.expense.name,
  subcategories: _petsSubcategories,
);
final _gifts = SetupCategory(
  id: '',
  title: 'Gifts',
  transactionType: TransactionTypes.expense.name,
);

final _childCare = SetupCategory(
  id: '',
  title: 'Child care',
  transactionType: TransactionTypes.expense.name,
);
final _pocketMoney = SetupCategory(
  id: '',
  title: 'Pocket money',
  transactionType: TransactionTypes.expense.name,
);
final _schoolTrips = SetupCategory(
  id: '',
  title: 'School trips',
  transactionType: TransactionTypes.expense.name,
);
final _tuition = SetupCategory(
  id: '',
  title: 'Tuition',
  transactionType: TransactionTypes.expense.name,
);
final _clothesAndShoes = SetupCategory(
  id: '',
  title: 'Clothes and shoes',
  transactionType: TransactionTypes.expense.name,
);
final _schoolSupplies = SetupCategory(
  id: '',
  title: 'School supplies',
  transactionType: TransactionTypes.expense.name,
);

final _hairdresser = SetupCategory(
  id: '',
  title: 'Hairdresser',
  transactionType: TransactionTypes.expense.name,
);
final _manicurePedicure = SetupCategory(
  id: '',
  title: 'Manicure, pedicure',
  transactionType: TransactionTypes.expense.name,
);
final _massage = SetupCategory(
  id: '',
  title: 'Massage',
  transactionType: TransactionTypes.expense.name,
);
final _beautyTreatments = SetupCategory(
  id: '',
  title: 'Beauty treatments',
  transactionType: TransactionTypes.expense.name,
);

final _onlineCourses = SetupCategory(
  id: '',
  title: 'Online courses',
  transactionType: TransactionTypes.expense.name,
);
final _schoolFees = SetupCategory(
  id: '',
  title: 'School fees',
  transactionType: TransactionTypes.expense.name,
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
final _transportationSubcategories = [
  _publicTransport,
  _taxi,
  _vehicle,
];
final _vehicleSubcategories = [
  _fuel,
  _leasing,
  _parking,
  _vehicleInsurance,
  _vehicleMaintenance,
];
final _entertainmentSubcategories = [
  _tvStreaming,
  _appSubscriptions,
  _games,
  _books,
  _events,
  _lotteryGambling,
];
final _travelSubcategories = [
  _accomodation,
  _travelTransportation,
  _travelFoodDrinks,
  _souvenirs,
  _travelEntertainment,
];
final _healthSubcategories = [
  _doctorCheckups,
  _dentist,
  _medication,
  _labTests,
  _psyhologicalSupport,
  _healthcareInsurance,
];
final _financialExpensesCategories = [
  _fines,
  _taxes,
  _advisory,
  _childSupport,
];
final _investmentsSubcategories = [
  _stocks,
  _indexFunds,
  _preciousMetals,
  _crypto,
  _pensionPayments,
];
final _shoppingSubcategories = [
  _clothes,
  _sportClothesEquipment,
  _shoes,
  _bags,
  _accessories,
  _jewlery,
  _cosmetics,
  _cleaning,
  _homeGarden,
  _pets,
  _gifts,
  _hygineProducts,
];
final _petsSubcategories = [
  _petFood,
  _petToys,
  _petClothesAccessories,
  _vetCheckups,
  _petCareProducts,
];
final _kidsSubcategories = [
  _childCare,
  _pocketMoney,
  _schoolTrips,
  _tuition,
  _clothesAndShoes,
  _schoolSupplies,
];
final _servicesTreatmentsSubcategories = [
  _hairdresser,
  _manicurePedicure,
  _massage,
  _beautyTreatments,
];
final _educationSubcategories = [
  _onlineCourses,
  _schoolFees,
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
final _transportation = SetupCategory(
  id: '',
  title: 'Transportation',
  transactionType: TransactionTypes.expense.name,
  categoryReason: CategoryReasons.need.name,
  subcategories: _transportationSubcategories,
);
final _entertainment = SetupCategory(
  id: '',
  title: 'Entertainment',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
  subcategories: _entertainmentSubcategories,
);
final _charity = SetupCategory(
  id: '',
  title: 'Charity',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
);
final _travel = SetupCategory(
  id: '',
  title: 'Travel',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
  subcategories: _travelSubcategories,
);
final _hobbies = SetupCategory(
  id: '',
  title: 'Hobbies',
  categoryReason: CategoryReasons.want.name,
  transactionType: TransactionTypes.expense.name,
);
final _health = SetupCategory(
  id: '',
  transactionType: TransactionTypes.expense.name,
  title: 'Health',
  categoryReason: CategoryReasons.need.name,
  subcategories: _healthSubcategories,
);
final _financialExpenses = SetupCategory(
  id: '',
  title: 'Financial expenses',
  transactionType: TransactionTypes.expense.name,
  subcategories: _financialExpensesCategories,
);
final _investments = SetupCategory(
  id: '',
  title: 'Investments',
  transactionType: TransactionTypes.expense.name,
  categoryReason: CategoryReasons.investment.name,
  subcategories: _investmentsSubcategories,
);
final _shopping = SetupCategory(
  id: '',
  title: 'Shopping',
  transactionType: TransactionTypes.expense.name,
  subcategories: _shoppingSubcategories,
);
final _kids = SetupCategory(
  id: '',
  title: 'Kids',
  transactionType: TransactionTypes.expense.name,
  subcategories: _kidsSubcategories,
);
final _serviceTreatments = SetupCategory(
  id: '',
  title: 'Service treatments',
  transactionType: TransactionTypes.expense.name,
  subcategories: _servicesTreatmentsSubcategories,
);
final _education = SetupCategory(
  id: '',
  title: 'Education',
  transactionType: TransactionTypes.expense.name,
  subcategories: _educationSubcategories,
);
final _sportFitness = SetupCategory(
  id: '',
  title: 'Sport, fitness',
  transactionType: TransactionTypes.expense.name,
);

final expenseCategories = [
  _foodDrinks,
  _housing,
  _transportation,
  _entertainment,
  _charity,
  _travel,
  _hobbies,
  _health,
  _financialExpenses,
  _investments,
  _shopping,
  _kids,
  _serviceTreatments,
  _education,
  _sportFitness,
];
