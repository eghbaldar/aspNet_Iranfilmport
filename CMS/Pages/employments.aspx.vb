
Partial Class CMS_Pages_Default2
	Inherits System.Web.UI.Page
	Public Function getDate(e As Object) As String
		Return ShamsiDate.Miladi2Shamsi(e, ShamsiDate.ShowType.LongDate)
	End Function
	Protected Sub cmd_category_DataBinding(sender As Object, e As EventArgs)
		Dim dropdown As DropDownList = CType(sender, DropDownList)
		Dim row As GridViewRow = CType(dropdown.NamingContainer, GridViewRow)

		' Retrieve the Category value from the data item bound to the row
		Dim categoryValue As String = DataBinder.Eval(row.DataItem, "Category").ToString()

		' Find the list item with the corresponding value and set it as selected
		Dim itemToSelect As ListItem = dropdown.Items.FindByValue(categoryValue)
		If itemToSelect IsNot Nothing Then
			dropdown.ClearSelection()
			itemToSelect.Selected = True
		End If
	End Sub

End Class
