using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dapper;

public class DataAccess
{
    private readonly string connectionString;

    public DataAccess(string connectionString)
    {
        this.connectionString = connectionString;
    }

    public Item GetItemById(int itemId)
    {
        using (IDbConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            return connection.QueryFirstOrDefault<Item>("SELECT * FROM Items WHERE ItemID = @ItemId", new { ItemId = itemId });
        }
    }

    public IEnumerable<Item> GetAllItems()
    {
        using (IDbConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            return connection.Query<Item>("SELECT * FROM Items");
        }
    }

    public void UpdateItem(Item item)
    {
        using (IDbConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            connection.Execute("UPDATE Items SET Name = @Name, Type = @Type, Color = @Color, Calories = @Calories WHERE ItemID = @ItemID", item);
        }
    }

    public void DeleteItem(int itemId)
    {
        using (IDbConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            connection.Execute("DELETE FROM Items WHERE ItemID = @ItemId", new { ItemId = itemId });
        }
    }

    public double GetAverageCalories()
    {
        using (IDbConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            return connection.ExecuteScalar<double>("SELECT AVG(Calories) FROM Items");
        }
    }
}

public class Item
{
    public int ItemID { get; set; }
    public string Name { get; set; }
    public string Type { get; set; }
    public string Color { get; set; }
    public int Calories { get; set; }
}

class Program
{
    static void Main(string[] args)
    {
        string connectionString = "Data Source=(local);Initial Catalog=VegetablesAndFruits;Integrated Security=True";

        DataAccess dataAccess = new DataAccess(connectionString);

        int itemId = 1;
        Item item = dataAccess.GetItemById(itemId);
        if (item != null)
        {
            Console.WriteLine($"По айди нашёл это: {item.Name}");
        }
        else
        {
            Console.WriteLine("Я не следопыт, сам ищи.");
        }

        IEnumerable<Item> allItems = dataAccess.GetAllItems();
        foreach (var currentItem in allItems)
        {
            Console.WriteLine($"Елемент: {currentItem.Name}");
        }

        Item itemToUpdate = dataAccess.GetItemById(2);
        if (itemToUpdate != null)
        {
            itemToUpdate.Name = "Помидор, зелёный";
            dataAccess.UpdateItem(itemToUpdate);
            Console.WriteLine("Оп оп, обновили.");
        }
        else
        {
            Console.WriteLine("Хз что обнавлять.");
        }

        int itemToDeleteId = 3;
        dataAccess.DeleteItem(itemToDeleteId);
        Console.WriteLine("Стёрто.");

        double averageCalories = dataAccess.GetAverageCalories();
        Console.WriteLine($"Средние калории: {averageCalories}");

        Console.ReadLine();
    }
}
