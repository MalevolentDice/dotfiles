using System;
public interface IName
{
  IAge WithName(string name);
}

public interface IAge
{
  IPersist WithAge(int age);
}

public interface IPersist
{
  void Save();
}

public class Person : IName, IAge, IPersist
{
  public string Name { get; private set; }
  public int Age { get; private set; }

  private Person()  {}

  public static IName Create()
  {
    return new Person();
  }

  public IAge WithName(string name)
  {
    Name = name;
    return this;
  }

  public IPersist WithAge(int age)
  {
    Age = age;
    return this;
  }

  public void Save()
  {
    Console.WriteLine("Name is :"+Name);
    Console.WriteLine("Age is :"+Age);
    Console.WriteLine("Save Called");
  }
}

public class Program
{
  public static void Main(string[] args)
  {
    Person
      .Create()
      .WithName("Venkat")
      .WithAge(25)
      .Save();
    
  }
}
