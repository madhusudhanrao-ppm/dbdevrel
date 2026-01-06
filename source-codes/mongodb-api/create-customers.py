from pymongo import MongoClient

# Replace with your MongoDB connection URL from Task 1
connection_url = "mongodb://demouser:Welcome123456#@R9NV7IFXZVF7RHN-INDEDUCATION.adb.ap-mumbai-1.oraclecloudapps.com:27017/demouser?authMechanism=PLAIN&authSource=$external&ssl=true&retryWrites=false&loadBalanced=true"

def create_customers_collection(db):
    """Create customers collection with sample data"""
    # Drop existing collection to start fresh
    if 'mycustomers' in db.list_collection_names():
        db['mycustomers'].drop()
        print("✓ Dropped existing mycustomers collection")

    # Create mycustomers collection and insert sample data
    customers_data = [
        {
            "_id": 1,
            "name": "John Smith",
            "email": "john.smith@example.com",
            "city": "New York",
            "phone": "+1-212-555-0100",
            "accountStatus": "active"
        },
        {
            "_id": 2,
            "name": "Sarah Johnson",
            "email": "sarah.johnson@example.com",
            "city": "San Francisco",
            "phone": "+1-415-555-0200",
            "accountStatus": "active"
        },
        {
            "_id": 3,
            "name": "Michael Chen",
            "email": "michael.chen@example.com",
            "city": "Seattle",
            "phone": "+1-206-555-0300",
            "accountStatus": "inactive"
        },
        {
            "_id": 4,
            "name": "Emily Rodriguez",
            "email": "emily.rodriguez@example.com",
            "city": "Austin",
            "phone": "+1-512-555-0400",
            "accountStatus": "active"
        },
        {
            "_id": 5,
            "name": "David Wilson",
            "email": "david.wilson@example.com",
            "city": "Boston",
            "phone": "+1-617-555-0500",
            "accountStatus": "active"
        }
    ]

    result = db['mycustomers'].insert_many(customers_data)
    print(f"✓ Created mycustomers collection with {len(result.inserted_ids)} documents")
    return result

def query_customer_by_name(db, customer_name):
    """Query customer collection by customer name"""
    customer = db['mycustomers'].find_one({"name": customer_name})
    
    if customer:
        print(f"\n✓ Found customer: {customer_name}")
        print(f"  Email: {customer.get('email')}")
        print(f"  City: {customer.get('city')}")
        print(f"  Phone: {customer.get('phone')}")
        print(f"  Status: {customer.get('accountStatus')}")
        return customer
    else:
        print(f"✗ Customer '{customer_name}' not found")
        return None

def list_all_customers(db):
    """List all customers in the collection"""
    customers = db['mycustomers'].find()
    print("\n✓ All Customers:")
    for customer in customers:
        print(f"  - {customer['name']} ({customer['email']}) - {customer['city']}")

try:
    client = MongoClient(connection_url)
    db = client['demouser']

    # Verify connection
    print("✓ Connected successfully to Oracle Autonomous AI Database")

    # Create customers collection with sample data
    create_customers_collection(db)

    # List all customers
    list_all_customers(db)

    # Query customers by name
    print("\n" + "="*60)
    print("Querying customers by name:")
    print("="*60)
    
    query_customer_by_name(db, "John Smith")
    query_customer_by_name(db, "Sarah Johnson")
    query_customer_by_name(db, "Jane Doe")  # This customer doesn't exist

except Exception as e:
    print(f"✗ Connection failed: {e}")
finally:
    client.close()
    print("\n✓ Database connection closed")