const TransactionTypes = {
    expense: 'expense',
    income: 'income',
};

const CategoryReasons = {
    want: 'want',
    need: 'need',
    investment: 'investment',
};

const _healthy = {
    title: 'Healthy',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.need,
};
const _unhealthy = {
    title: 'Unhealthy',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.want,
};

const _restaurants = {
    title: 'Restaurant',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.want,
};
const _barCafe = {
    title: 'Bar, cafe',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.want,
};
const _groceries = {
    title: 'Groceries',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _healthy,
        _unhealthy,
    ],
};

const _utilities = {
    transactionType: TransactionTypes.expense,
    title: 'Utilities',
};
const _maintenanceRepairs = {
    transactionType: TransactionTypes.expense,
    title: 'Maintenance, repairs',
};
const _mortgage = {
    transactionType: TransactionTypes.expense,
    title: 'Mortgage',
};
const _propertyInsurance = {
    transactionType: TransactionTypes.expense,
    title: 'Property insurance',
};
const _rent = {
    transactionType: TransactionTypes.expense,
    title: 'Rent',
};
const _services = {
    transactionType: TransactionTypes.expense,
    title: 'Services',
};

const _fuel = {
    transactionType: TransactionTypes.expense,
    title: 'Fuel',
};
const _leasing = {
    transactionType: TransactionTypes.expense,
    title: 'Leasing',
};
const _parking = {
    transactionType: TransactionTypes.expense,
    title: 'Parking',
};
const _vehicleInsurance = {
    transactionType: TransactionTypes.expense,
    title: 'Vehicle insurance',
};
const _vehicleMaintenance = {
    transactionType: TransactionTypes.expense,
    title: 'Vehicle maintenance',
};

const _publicTransport = {
    transactionType: TransactionTypes.expense,
    title: 'Public transport',
};
const _taxi = {
    transactionType: TransactionTypes.expense,
    title: 'Taxi',
};
const _vehicle = {
    transactionType: TransactionTypes.expense,
    title: 'Vehicle',
    subcategories: [
        _fuel,
        _leasing,
        _parking,
        _vehicleInsurance,
        _vehicleMaintenance,
    ],
};

const _tvStreaming = {
    transactionType: TransactionTypes.expense,
    title: 'TV, streaming',
};
const _appSubscriptions = {
    transactionType: TransactionTypes.expense,
    title: 'App subscriptions',
};
const _games = {
    transactionType: TransactionTypes.expense,
    title: 'Games',
};
const _books = {
    transactionType: TransactionTypes.expense,
    title: 'Books',
};
const _events = {
    transactionType: TransactionTypes.expense,
    title: 'Events',
};
const _expenseLotteryGambling = {
    transactionType: TransactionTypes.expense,
    title: 'Lottery, gambling',
};

const _accomodation = {
    transactionType: TransactionTypes.expense,
    title: 'Accomodation',
};
const _travelTransportation = {
    transactionType: TransactionTypes.expense,
    title: 'Transportation',
};
const _travelFoodDrinks = {
    transactionType: TransactionTypes.expense,
    title: 'Food & Drinks',
};
const _souvenirs = {
    transactionType: TransactionTypes.expense,
    title: 'Souvenirs',
};
const _travelEntertainment = {
    transactionType: TransactionTypes.expense,
    title: 'Entertainment',
};

const _doctorCheckups = {
    title: 'Doctor checkups',
    transactionType: TransactionTypes.expense,
};
const _medication = {
    title: 'Medication',
    transactionType: TransactionTypes.expense,
};
const _labTests = {
    title: 'Lab tests',
    transactionType: TransactionTypes.expense,
};
const _dentist = {
    title: 'Dentist',
    transactionType: TransactionTypes.expense,
};
const _psyhologicalSupport = {
    title: 'Psyhological support',
    transactionType: TransactionTypes.expense,
};
const _healthcareInsurance = {
    title: 'Healthcare insurance',
    transactionType: TransactionTypes.expense,
};

const _fines = {
    title: 'Fines',
    categoryReason: CategoryReasons.need,
    transactionType: TransactionTypes.expense,
};
const _taxes = {
    title: 'Taxes',
    categoryReason: CategoryReasons.need,
    transactionType: TransactionTypes.expense,
};
const _advisory = {
    title: 'Advisory',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
};
const _expenseChildSupport = {
    title: 'Child support',
    categoryReason: CategoryReasons.need,
    transactionType: TransactionTypes.expense,
};

const _stocks = {
    title: 'Stocks',
    transactionType: TransactionTypes.expense,
};
const _indexFunds = {
    title: 'Index funds',
    transactionType: TransactionTypes.expense,
};
const _preciousMetals = {
    title: 'Precious metals',
    transactionType: TransactionTypes.expense,
};
const _crypto = {
    title: 'Crypto',
    transactionType: TransactionTypes.expense,
};
const _pensionPayments = {
    title: 'Pension payments',
    transactionType: TransactionTypes.expense,
};

const _petFood = {
    title: 'Food',
    transactionType: TransactionTypes.expense,
};
const _petToys = {
    title: 'Toys',
    transactionType: TransactionTypes.expense,
};
const _petClothesAccessories = {
    title: 'Clothes & Accessories',
    transactionType: TransactionTypes.expense,
};
const _vetCheckups = {
    title: 'Vet checkups',
    transactionType: TransactionTypes.expense,
};
const _petCareProducts = {
    title: 'Care products',
    transactionType: TransactionTypes.expense,
};


const _clothes = {
    title: 'Clothes',
    transactionType: TransactionTypes.expense,
};
const _sportClothesEquipment = {
    title: 'Sport clothes & equipment',
    transactionType: TransactionTypes.expense,
};
const _shoes = {
    title: 'Shoes',
    transactionType: TransactionTypes.expense,
};
const _bags = {
    title: 'Bags',
    transactionType: TransactionTypes.expense,
};
const _accessories = {
    title: 'Accessories',
    transactionType: TransactionTypes.expense,
};
const _jewlery = {
    title: 'Jewlery',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
};
const _cosmetics = {
    title: 'Cosmetics',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
};
const _hygineProducts = {
    title: 'Hygine products',
    transactionType: TransactionTypes.expense,
};
const _cleaning = {
    title: 'Cleaning',
    categoryReason: CategoryReasons.need,
    transactionType: TransactionTypes.expense,
};
const _homeGarden = {
    title: 'Home, garden',
    transactionType: TransactionTypes.expense,
};
const _pets = {
    title: 'Pets',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _petFood,
        _petToys,
        _petClothesAccessories,
        _vetCheckups,
        _petCareProducts,
    ],
};
const _expenseGifts = {
    title: 'Gifts',
    transactionType: TransactionTypes.expense,
};

const _childCare = {
    title: 'Child care',
    transactionType: TransactionTypes.expense,
};
const _pocketMoney = {
    title: 'Pocket money',
    transactionType: TransactionTypes.expense,
};
const _schoolTrips = {
    title: 'School trips',
    transactionType: TransactionTypes.expense,
};
const _tuition = {
    title: 'Tuition',
    transactionType: TransactionTypes.expense,
};
const _clothesAndShoes = {
    title: 'Clothes and shoes',
    transactionType: TransactionTypes.expense,
};
const _schoolSupplies = {
    title: 'School supplies',
    transactionType: TransactionTypes.expense,
};

const _hairdresser = {
    title: 'Hairdresser',
    transactionType: TransactionTypes.expense,
};
const _manicurePedicure = {
    title: 'Manicure, pedicure',
    transactionType: TransactionTypes.expense,
};
const _massage = {
    title: 'Massage',
    transactionType: TransactionTypes.expense,
};
const _beautyTreatments = {
    title: 'Beauty treatments',
    transactionType: TransactionTypes.expense,
};

const _onlineCourses = {
    title: 'Online courses',
    transactionType: TransactionTypes.expense,
};
const _schoolFees = {
    title: 'School fees',
    transactionType: TransactionTypes.expense,
};


const _foodAndDrinks = {
    title: 'Food & Drinks',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _restaurants,
        _barCafe,
        _groceries,
    ]
};
const _housing = {
    title: 'Housing',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.need,
    subcategories: [
        _utilities,
        _maintenanceRepairs,
        _mortgage,
        _propertyInsurance,
        _rent,
        _services,
    ],
};
const _transportation = {
    title: 'Transportation',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.need,
    subcategories: [
        _publicTransport,
        _taxi,
        _vehicle,
    ],
};
const _entertainment = {
    title: 'Entertainment',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
    subcategories: [
        _tvStreaming,
        _appSubscriptions,
        _games,
        _books,
        _events,
        _expenseLotteryGambling,
    ],
}
const _charity = {
    title: 'Charity',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
};
const _travel = {
    title: 'Travel',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
    subcategories: [
        _accomodation,
        _travelTransportation,
        _travelFoodDrinks,
        _souvenirs,
        _travelEntertainment,
    ],
};
const _hobbies = {
    title: 'Hobbies',
    categoryReason: CategoryReasons.want,
    transactionType: TransactionTypes.expense,
};
const _health = {
    transactionType: TransactionTypes.expense,
    title: 'Health',
    categoryReason: CategoryReasons.need,
    subcategories: [
        _doctorCheckups,
        _dentist,
        _medication,
        _labTests,
        _psyhologicalSupport,
        _healthcareInsurance,
    ],
};
const _financialExpenses = {
    title: 'Financial expenses',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _fines,
        _taxes,
        _advisory,
        _expenseChildSupport,
    ],
};
const _investments = {
    title: 'Investments',
    transactionType: TransactionTypes.expense,
    categoryReason: CategoryReasons.investment,
    subcategories: [
        _stocks,
        _indexFunds,
        _preciousMetals,
        _crypto,
        _pensionPayments,
    ],
};
const _shopping = {
    title: 'Shopping',
    transactionType: TransactionTypes.expense,
    subcategories: [
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
        _expenseGifts,
        _hygineProducts,
    ],
};
const _kids = {
    title: 'Kids',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _childCare,
        _pocketMoney,
        _schoolTrips,
        _tuition,
        _clothesAndShoes,
        _schoolSupplies,
    ],
};
const _serviceTreatments = {
    title: 'Service treatments',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _hairdresser,
        _manicurePedicure,
        _massage,
        _beautyTreatments,
    ],
};
const _education = {
    title: 'Education',
    transactionType: TransactionTypes.expense,
    subcategories: [
        _onlineCourses,
        _schoolFees,
    ],
};
const _sportFitness = {
    title: 'Sport, fitness',
    transactionType: TransactionTypes.expense,
};

const _interestsDividends = {
    title: 'Interests, dividends',
    transactionType: TransactionTypes.income,
};
const _rentalIncome = {
    title: 'Rental income',
    transactionType: TransactionTypes.income,
};
const _incomeGifts = {
    title: 'Gifts',
    transactionType: TransactionTypes.income,
};
const _incomeLotteryGambling = {
    title: 'Lottery, gambling',
    transactionType: TransactionTypes.income,
};
const _salary = {
    title: 'Salary',
    transactionType: TransactionTypes.income,
};
const _incomeChildSupport = {
    title: 'Child support',
    transactionType: TransactionTypes.income,
};

const _expenseCategories = [
    _foodAndDrinks,
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

const _incomeCategories = [
    _interestsDividends,
    _rentalIncome,
    _incomeGifts,
    _incomeLotteryGambling,
    _salary,
    _incomeChildSupport,
];

export const categories = [
    ..._expenseCategories,
    ..._incomeCategories,
];