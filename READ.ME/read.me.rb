MoneyCashboard
You want to start tracking your spending in an attempt to be more frugal with money.
You have decided to make a budgeting app to help you see where all of your money is being spent.
You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco,
and a value ) which have an associated Tag (e.g. 'food', 'clothes').
Your app would then be able to track a total, and display this in a view.

MVP:
Create new transactions
Display a list of all transactions
Display total amount spent
Display total amount spent by tag

Possible Extensions:
CRUD actions for the transactions
Show a warning when the total expenditure is over budget (set a hard coded budget first)
Add a date to the transactions and view total spending by month
Any other ideas you might come up with

<h1>All Transactions</h1>
<table class="transactions">
  <tr>
    <th>Value</th>
    <th>Type</th>
    <th>Merchant</th>
    <th>Delete</th>
  </tr>

  <% @transactions.each do |transaction| %>
  <tr>
    <td>£<%= transaction.value %></td>
    <td>
      <a href="/transactions/total_by_tag/<%= transaction.tag.id %>" style="text-decoration:none">
        <%= transaction.tag.name %>
      </a>
    </td>
    <td><%= transaction.merchant.merchant_name %></td>
    <td>
      <form method = "post" action = "/transactions/<%= transaction.id %>" >
        <input type ="hidden" name="_method" value="delete"/>
        <button class="button1" type="delete">Delete</button>
      </form>
    </td>
  </tr>

  <% end %>

</table>

<div class="p1_image">
  <img src="/images/p6.jpeg" alt="Image of piggy bank">
</div>

The project was one of four options plus the option to create your own if needed.
The reason that I chose to do MoneyCashboard was mainly because I understood the
final goal of having a way to manage and interact with your finances.
The final outcome of the project met the mvp with a couple of extensions.
In the draft of the code it was possilbe to view all transactions, create transactions,
return a sum total of transactions, view transactions by type and delete transactions.

https://github.com/DeepCFoxXx/Project_01.git
