// ASP.NET Maker 2019
// Copyright (c) 2019 e.World Technology Limited. All rights reserved.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Dynamic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures.Internal;
using Microsoft.AspNetCore.Routing;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Primitives;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Net.Http.Headers;
using Ganss.XSS;
using ImageMagick;
using MimeDetective.InMemory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;
using static AspNetMaker2019.Models.project1;

// Models (Table)
namespace AspNetMaker2019.Models {

	// Partial class
	public partial class project1 {

		/// <summary>
		/// VCNVISITANTE
		/// </summary>

		public static _VCNVISITANTE VCNVISITANTE {
			get => HttpData.GetOrCreate<_VCNVISITANTE>("VCNVISITANTE");
			set => HttpData["VCNVISITANTE"] = value;
		}

		/// <summary>
		/// Table class for VCNVISITANTE
		/// </summary>

		public class _VCNVISITANTE: DbTable {
			public int RowCnt = 0; // DN
			public bool UseSessionForListSql = true;

			// Column CSS classes
			public string LeftColumnClass = "col-sm-2 col-form-label ew-label";
			public string RightColumnClass = "col-sm-10";
			public string OffsetColumnClass = "col-sm-10 offset-sm-2";
			public string TableLeftColumnClass = "w-col-2";
			public readonly DbField<SqlDbType> OID;
			public readonly DbField<SqlDbType> VTEDOCUMENTO;
			public readonly DbField<SqlDbType> VTETIPODOCUM;
			public readonly DbField<SqlDbType> VTEPRINOM;
			public readonly DbField<SqlDbType> VTESEGNOM;
			public readonly DbField<SqlDbType> VTEPRIAPE;
			public readonly DbField<SqlDbType> VTESEGAPE;
			public readonly DbField<SqlDbType> VTEGENERO;
			public readonly DbField<SqlDbType> VTEFOTO;
			public readonly DbField<SqlDbType> OptimisticLockField;

			// Constructor
			public _VCNVISITANTE() {

				// Language object // DN
				Language = Language ?? new Lang();
				TableVar = "VCNVISITANTE";
				Name = "VCNVISITANTE";
				Type = "TABLE";

				// Update Table
				UpdateTable = "[dbo].[VCNVISITANTE]";
				DbId = "DB"; // DN
				ExportAll = true;
				ExportPageBreakCount = 0; // Page break per every n record (PDF only)
				ExportPageOrientation = "portrait"; // Page orientation (PDF only)
				ExportPageSize = "a4"; // Page size (PDF only)
				ExportExcelPageOrientation = ""; // Page orientation (EPPlus only)
				ExportExcelPageSize = ""; // Page size (EPPlus only)
				ExportColumnWidths = new float[] {  }; // Column widths (PDF only) // DN
				DetailAdd = false; // Allow detail add
				DetailEdit = false; // Allow detail edit
				DetailView = false; // Allow detail view
				ShowMultipleDetails = false; // Show multiple details
				GridAddRowCount = 5;
				AllowAddDeleteRow = true; // Allow add/delete row
				UserIdAllowSecurity = 0; // User ID Allow
				BasicSearch = new BasicSearch(TableVar);

				// OID
				OID = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_OID",
					Name = "OID",
					Expression = "[OID]",
					BasicSearchExpression = "CAST([OID] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[OID]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "NO",
					IsAutoIncrement = true, // Autoincrement field
					IsPrimaryKey = true, // Primary key field
					Nullable = false, // NOT NULL field
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				OID.Init(this); // DN
				Fields.Add("OID", OID);

				// VTEDOCUMENTO
				VTEDOCUMENTO = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTEDOCUMENTO",
					Name = "VTEDOCUMENTO",
					Expression = "[VTEDOCUMENTO]",
					BasicSearchExpression = "[VTEDOCUMENTO]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[VTEDOCUMENTO]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				VTEDOCUMENTO.Init(this); // DN
				Fields.Add("VTEDOCUMENTO", VTEDOCUMENTO);

				// VTETIPODOCUM
				VTETIPODOCUM = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTETIPODOCUM",
					Name = "VTETIPODOCUM",
					Expression = "[VTETIPODOCUM]",
					BasicSearchExpression = "CAST([VTETIPODOCUM] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[VTETIPODOCUM]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				VTETIPODOCUM.Init(this); // DN
				Fields.Add("VTETIPODOCUM", VTETIPODOCUM);

				// VTEPRINOM
				VTEPRINOM = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTEPRINOM",
					Name = "VTEPRINOM",
					Expression = "[VTEPRINOM]",
					BasicSearchExpression = "[VTEPRINOM]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[VTEPRINOM]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				VTEPRINOM.Init(this); // DN
				Fields.Add("VTEPRINOM", VTEPRINOM);

				// VTESEGNOM
				VTESEGNOM = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTESEGNOM",
					Name = "VTESEGNOM",
					Expression = "[VTESEGNOM]",
					BasicSearchExpression = "[VTESEGNOM]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[VTESEGNOM]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				VTESEGNOM.Init(this); // DN
				Fields.Add("VTESEGNOM", VTESEGNOM);

				// VTEPRIAPE
				VTEPRIAPE = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTEPRIAPE",
					Name = "VTEPRIAPE",
					Expression = "[VTEPRIAPE]",
					BasicSearchExpression = "[VTEPRIAPE]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[VTEPRIAPE]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				VTEPRIAPE.Init(this); // DN
				Fields.Add("VTEPRIAPE", VTEPRIAPE);

				// VTESEGAPE
				VTESEGAPE = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTESEGAPE",
					Name = "VTESEGAPE",
					Expression = "[VTESEGAPE]",
					BasicSearchExpression = "[VTESEGAPE]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[VTESEGAPE]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				VTESEGAPE.Init(this); // DN
				Fields.Add("VTESEGAPE", VTESEGAPE);

				// VTEGENERO
				VTEGENERO = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTEGENERO",
					Name = "VTEGENERO",
					Expression = "[VTEGENERO]",
					BasicSearchExpression = "CAST([VTEGENERO] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[VTEGENERO]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				VTEGENERO.Init(this); // DN
				Fields.Add("VTEGENERO", VTEGENERO);

				// VTEFOTO
				VTEFOTO = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_VTEFOTO",
					Name = "VTEFOTO",
					Expression = "[VTEFOTO]",
					BasicSearchExpression = "[VTEFOTO]",
					Type = 204,
					DbType = SqlDbType.VarBinary,
					DateTimeFormat = -1,
					VirtualExpression = "[VTEFOTO]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "FILE",
					Sortable = true, // Allow sort
					IsUpload = true
				};
				VTEFOTO.Init(this); // DN
				Fields.Add("VTEFOTO", VTEFOTO);

				// OptimisticLockField
				OptimisticLockField = new DbField<SqlDbType> {
					TableVar = "VCNVISITANTE",
					TableName = "VCNVISITANTE",
					FieldVar = "x_OptimisticLockField",
					Name = "OptimisticLockField",
					Expression = "[OptimisticLockField]",
					BasicSearchExpression = "CAST([OptimisticLockField] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[OptimisticLockField]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				OptimisticLockField.Init(this); // DN
				Fields.Add("OptimisticLockField", OptimisticLockField);
			}

			// Set Field Visibility
			public override bool GetFieldVisibility(string fldname) {
				var fld = FieldByName(fldname);
				return fld.Visible; // Returns original value
			}

			// Invoke method // DN
			public object Invoke(string name, object[] parameters = null) {
				MethodInfo mi = this.GetType().GetMethod(name);
				if (mi != null) {
					if (IsAsyncMethod(mi)) {
						return InvokeAsync(mi, parameters).GetAwaiter().GetResult();
					} else {
						return mi.Invoke(this, parameters);
					}
				}
				return null;
			}

			// Invoke async method // DN
			public async Task<object> InvokeAsync(MethodInfo mi, object[] parameters = null) {
				if (mi != null) {
					dynamic awaitable = mi.Invoke(this, parameters);
					await awaitable;
					return awaitable.GetAwaiter().GetResult();
				}
				return null;
			}

			#pragma warning disable 1998

			// Invoke async method // DN
			public async Task<object> InvokeAsync(string name, object[] parameters = null) => InvokeAsync(this.GetType().GetMethod(name), parameters);

			#pragma warning restore 1998

			// Check if Invoke async method // DN
			public bool IsAsyncMethod(MethodInfo mi) {
				if (mi != null) {
					Type attType = typeof(AsyncStateMachineAttribute);
					var attrib = (AsyncStateMachineAttribute)mi.GetCustomAttribute(attType);
					return (attrib != null);
				}
				return false;
			}

			// Check if Invoke async method // DN
			public bool IsAsyncMethod(string name) => IsAsyncMethod(this.GetType().GetMethod(name));

			#pragma warning disable 618

			// Connection
			public virtual DatabaseConnectionBase<SqlConnection, SqlCommand, SqlDataReader, SqlDbType> Connection => GetConnection(DbId);

			#pragma warning restore 618

			// Set left column class (must be predefined col-*-* classes of Bootstrap grid system)
			public void SetLeftColumnClass(string columnClass) {
				Match m = Regex.Match(columnClass, @"^col\-(\w+)\-(\d+)$");
				if (m.Success) {
					LeftColumnClass = columnClass + " col-form-label ew-label";
					RightColumnClass = "col-" + m.Groups[1].Value + "-" + Convert.ToString(12 - ConvertToInt(m.Groups[2].Value));
					OffsetColumnClass = RightColumnClass + " " + columnClass.Replace("col-", "offset-");
					TableLeftColumnClass = Regex.Replace(columnClass, @"/^col-\w+-(\d+)$/", "w-col-$1"); // Change to w-col-*
				}
			}

			// Single column sort
			public void UpdateSort(DbField fld) {
				string lastSort, sortField, thisSort;
				if (CurrentOrder == fld.Name) {
					sortField = fld.Expression;
					lastSort = fld.Sort;
					if (CurrentOrderType == "ASC" || CurrentOrderType == "DESC") {
						thisSort = CurrentOrderType;
					} else {
						thisSort = (lastSort == "ASC") ? "DESC" : "ASC";
					}
					fld.Sort = thisSort;
					SessionOrderBy = sortField + " " + thisSort; // Save to Session
				} else {
					fld.Sort = "";
				}
			}

			// WHERE // DN
			private string _sqlWhere = null;
			public string SqlWhere {
				get {
					string where = "";
					return _sqlWhere ?? where;
				}
				set {
					_sqlWhere = value;
				}
			}

			// Group By
			private string _sqlGroupBy = null;
			public string SqlGroupBy {
				get => _sqlGroupBy ?? "";
				set => _sqlGroupBy = value;
			}

			// Having
			private string _sqlHaving = null;
			public string SqlHaving {
				get => _sqlHaving ?? "";
				set => _sqlHaving = value;
			}

			// Apply User ID filters
			public string ApplyUserIDFilters(string filter) {
				return filter;
			}

			// Check if User ID security allows view all
			public bool UserIDAllow(string id = "") {
				int allow = Config.UserIdAllow;
				switch (id) {
					case "add":
					case "copy":
					case "gridadd":
					case "register":
					case "addopt":
						return ((allow & 1) == 1);
					case "edit":
					case "gridedit":
					case "update":
					case "changepwd":
					case "forgotpwd":
						return ((allow & 4) == 4);
					case "delete":
						return ((allow & 2) == 2);
					case "view":
						return ((allow & 32) == 32);
					case "search":
						return ((allow & 64) == 64);
					default:
						return ((allow & 8) == 8);
				}
			}

			// Get record count by reading data reader
			public async Task<int> GetRecordCount(string sql) { // use by Lookup // DN
				try {
					var cnt = 0;
					using (var dr = await Connection.OpenDataReaderAsync(sql)) {
						while (await dr.ReadAsync())
							cnt++;
					}
					return cnt;
				} catch {
					if (Config.Debug)
						throw;
					return -1;
				}
			}

			// Try to get record count by SELECT COUNT(*)
			public async Task<int> TryGetRecordCount(string sql) {
				string orderBy = OrderBy;
				sql = Regex.Replace(sql, @"/\*BeginOrderBy\*/[\s\S]+/\*EndOrderBy\*/", "", RegexOptions.IgnoreCase).Trim(); // Remove ORDER BY clause (MSSQL)
				if (!string.IsNullOrEmpty(orderBy) && sql.EndsWith(orderBy))
					sql = sql.Substring(0, sql.Length - orderBy.Length); // Remove ORDER BY clause
				try {
					string sqlcnt;
					if ((new List<string> { "TABLE", "VIEW", "LINKTABLE" }).Contains(Type) && sql.StartsWith(SqlSelect)) { // Handle Custom Field
						sqlcnt = "SELECT COUNT(*) FROM " + SqlFrom + sql.Substring(SqlSelect.Length);
					} else {
						sqlcnt = "SELECT COUNT(*) FROM (" + sql + ") EW_COUNT_TABLE";
					}
					return Convert.ToInt32(await Connection.ExecuteScalarAsync(sqlcnt));
				} catch {
					return await GetRecordCount(sql);
				}
			}

			// Get ORDER BY clause
			public string OrderBy {
				get {
					string sort = SessionOrderBy;
					return BuildSelectSql("", "", "", "", SqlOrderBy, "", sort);
				}
			}

			// SELECT
			private string _sqlSelect = null;
			public string SqlSelect { // Select
				get => _sqlSelect ?? "SELECT * FROM " + SqlFrom;
				set => _sqlSelect = value;
			}

			// Table level SQL
			// FROM

			private string _sqlFrom = null;
			public string SqlFrom {
				get => _sqlFrom ?? "[dbo].[VCNVISITANTE]";
				set => _sqlFrom = value;
			}

			// Order By
			private string _sqlOrderBy = null;
			public string SqlOrderBy {
				get => _sqlOrderBy ?? "";
				set => _sqlOrderBy = value;
			}

			// Get SQL
			public string GetSql(string where, string orderBy = "") => BuildSelectSql(SqlSelect, SqlWhere, SqlGroupBy, SqlHaving, SqlOrderBy, where, orderBy);

			// Table SQL
			public string CurrentSql {
				get {
					string filter = CurrentFilter;
					string sort = SessionOrderBy;
					return GetSql(filter, sort);
				}
			}

			// Table SQL with List page filter
			public string ListSql {
				get {
					string sort = "";
					string select = "";
					string filter = UseSessionForListSql ? SessionWhere : "";
					AddFilter(ref filter, CurrentFilter);
					Recordset_Selecting(ref filter);
					select = SqlSelect;
					sort = UseSessionForListSql ? SessionOrderBy : "";
					return BuildSelectSql(select, SqlWhere, SqlGroupBy, SqlHaving, SqlOrderBy, filter, sort);
				}
			}

			// Get record count based on filter (for detail record count in master table pages)
			public async Task<int> LoadRecordCount(string filter) => await TryGetRecordCount(GetSql(filter));

			// Get record count (for current List page)
			public async Task<int> ListRecordCount() => await TryGetRecordCount(ListSql);

			// Insert
			public async Task<int> InsertAsync(Dictionary<string, object> row) {
				int result;
				var r = row.Where(kvp => {
					var fld = FieldByName(kvp.Key);
					return (fld != null && !fld.IsCustom);
				}).ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
				var fields = r.Select(kvp => Fields[kvp.Key]);
				var names = String.Join(",", fields.Select(fld => fld.Expression));
				var values = String.Join(",", fields.Select(fld => SqlParameter(fld)));
				if (Empty(names))
					return -1;
				string sql = "INSERT INTO " + UpdateTable + " (" + names + ") VALUES (" + values + ")";
				using (var command = Connection.GetCommand(sql)) {
					foreach (var (key, value) in r) {
						var fld = (DbField<SqlDbType>)Fields[key]; // DN
						try {
							command.Parameters.Add(fld.FieldVar, fld.DbType).Value = ParameterValue(fld, value);
						} catch {
							if (Config.Debug)
								throw;
						}
					}
					result = await command.ExecuteNonQueryAsync();
				}
				if (result > 0) {

					// Get insert ID
					OID.SetDbValue(await Connection.GetLastInsertIdAsync());
					row["OID"] = OID.DbValue;
				}
				return result;
			}

			// Insert
			public int Insert(Dictionary<string, object> row) => InsertAsync(row).GetAwaiter().GetResult();

			// Update

			#pragma warning disable 168, 219

			public async Task<int> UpdateAsync(Dictionary<string, object> row, object where = null, Dictionary<string, object> rsold = null, bool curfilter = true) {
				int result;
				var rscascade = new Dictionary<string, object>();
				string whereClause = "";
				row = row.Where(kvp => {
					var fld = FieldByName(kvp.Key);
					return fld != null && !fld.IsCustom;
				}).ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
				var fields = row.Select(kvp => Fields[kvp.Key]);
				var values = String.Join(",", fields.Select(fld => fld.Expression + "=" + SqlParameter(fld)));
				if (Empty(values))
					return -1;
				string sql = "UPDATE " + UpdateTable + " SET " + values;
				string filter = curfilter ? CurrentFilter : "";
				if (IsDictionary(where))
					whereClause = ArrayToFilter((IDictionary<string, object>)where);
				else
					whereClause = (string)where;
				AddFilter(ref filter, whereClause);
				if (!Empty(filter))
					sql += " WHERE " + filter;
				using (var command = Connection.GetCommand(sql)) {
					foreach (var (key, value) in row) {
						var fld = (DbField<SqlDbType>)Fields[key]; // DN
						try {
							command.Parameters.Add(fld.FieldVar, fld.DbType).Value = ParameterValue(fld, value);
						} catch {
							if (Config.Debug)
								throw;
						}
					}
					result = await command.ExecuteNonQueryAsync();
				}
				return result;
			}

			#pragma warning restore 168, 219

			// Update
			public int Update(Dictionary<string, object> row, object where = null, Dictionary<string, object> rsold = null, bool curfilter = true)
				=> UpdateAsync(row, where, rsold, curfilter).GetAwaiter().GetResult();

			// Convert to parameter name for use in SQL
			public string SqlParameter(DbField fld) {
				string symbol = GetSqlParamSymbol(DbId);
				string value = symbol;
				if (symbol != "?")
					value += fld.FieldVar;
				return value;
			}

			// Convert value to object for parameter
			public object ParameterValue(DbField fld, object value) {
				if (((DbField<SqlDbType>)fld).DbType == SqlDbType.Bit) {
					return ConvertToBool(value);
				}
				return value;
			}

			#pragma warning disable 168, 1998

			// Delete
			public async Task<int> DeleteAsync(Dictionary<string, object> row, object where = null, bool curfilter = true) {
				bool delete = true;
				string whereClause = "";
				string sql = "DELETE FROM " + UpdateTable + " WHERE ";
				string filter = curfilter ? CurrentFilter : "";
				if (IsDictionary(where))
					whereClause = ArrayToFilter((IDictionary<string, object>)where);
				else
					whereClause = (string)where;
				AddFilter(ref filter, whereClause);
				if (row != null) {
					DbField fld;
					fld = FieldByName("OID");
					AddFilter(ref filter, fld.Expression + "=" + QuotedValue(row["OID"], FieldByName("OID").DataType, DbId));
				}
				if (!Empty(filter))
					sql += filter;
				else
					sql += "0=1"; // Avoid delete
				int result = -1;
				if (delete)
					result = await Connection.ExecuteAsync(sql);
				return result;
			}

			#pragma warning restore 168, 1998

			// Delete
			public int Delete(Dictionary<string, object> row, object where = null, bool curfilter = true) =>
				DeleteAsync(row, where, curfilter).GetAwaiter().GetResult();

			// Load DbValue from recordset
			public void LoadDbValues(Dictionary<string, object> row) {
				if (row == null)
					return;
				OID.SetDbValue(row["OID"], false);
				VTEDOCUMENTO.SetDbValue(row["VTEDOCUMENTO"], false);
				VTETIPODOCUM.SetDbValue(row["VTETIPODOCUM"], false);
				VTEPRINOM.SetDbValue(row["VTEPRINOM"], false);
				VTESEGNOM.SetDbValue(row["VTESEGNOM"], false);
				VTEPRIAPE.SetDbValue(row["VTEPRIAPE"], false);
				VTESEGAPE.SetDbValue(row["VTESEGAPE"], false);
				VTEGENERO.SetDbValue(row["VTEGENERO"], false);
				VTEFOTO.Upload.DbValue = row["VTEFOTO"];
				OptimisticLockField.SetDbValue(row["OptimisticLockField"], false);
			}
			public void DeleteUploadedFiles(Dictionary<string, object> row) {
				LoadDbValues(row);
			}

			// Return URL
			public string ReturnUrl {
				get {
					string name = Config.ProjectName + "_" + TableVar + "_" + Config.TableReturnUrl;

					// Get referer URL automatically
					if (!Empty(ReferUrl()) && ReferPage() != CurrentPageName() &&
						ReferPage() != "login") {// Referer not same page or login page
							Session[name] = ReferUrl(); // Save to Session
					}
					if (!Empty(Session[name])) {
						return Session.GetString(name);
					} else {
						return "VCNVISITANTElist";
					}
				}
				set {
					Session[Config.ProjectName + "_" + TableVar + "_" + Config.TableReturnUrl] = value;
				}
			}

			// Get modal caption
			public string GetModalCaption(string pageName) {
				if (SameString(pageName, "VCNVISITANTEview"))
					return Language.Phrase("View");
				else if (SameString(pageName, "VCNVISITANTEedit"))
					return Language.Phrase("Edit");
				else if (SameString(pageName, "VCNVISITANTEadd"))
					return Language.Phrase("Add");
				else
					return "";
			}

			// List URL
			public string ListUrl => "VCNVISITANTElist";

			// View URL
			public string ViewUrl => GetViewUrl();

			// View URL
			public string GetViewUrl(string parm = "") {
				string url = "";
				if (!Empty(parm))
					url = KeyUrl("VCNVISITANTEview", UrlParm(parm));
				else
					url = KeyUrl("VCNVISITANTEview", UrlParm(Config.TableShowDetail + "="));
				return AddMasterUrl(url);
			}

			// Add URL
			public string AddUrl { get; set; } = "VCNVISITANTEadd";

			// Add URL
			public string GetAddUrl(string parm = "") {
				string url = "";
				if (!Empty(parm))
					url = "VCNVISITANTEadd?" + UrlParm(parm);
				else
					url = "VCNVISITANTEadd";
				return AppPath(AddMasterUrl(url));
			}

			// Edit URL
			public string EditUrl => GetEditUrl();

			// Edit URL (with parameter)
			public string GetEditUrl(string parm = "") {
				string url = "";
				url = KeyUrl("VCNVISITANTEedit", UrlParm(parm));
				return AppPath(AddMasterUrl(url)); // DN
			}

			// Inline edit URL
			public string InlineEditUrl =>
				AppPath(AddMasterUrl(KeyUrl(CurrentPageName(), UrlParm("action=edit")))); // DN

			// Copy URL
			public string CopyUrl => GetCopyUrl();

			// Copy URL
			public string GetCopyUrl(string parm = "") {
				string url = "";
				url = KeyUrl("VCNVISITANTEadd", UrlParm(parm));
				return AppPath(AddMasterUrl(url)); // DN
			}

			// Inline copy URL
			public string InlineCopyUrl =>
				AppPath(AddMasterUrl(KeyUrl(CurrentPageName(), UrlParm("action=copy")))); // DN

			// Delete URL
			public string DeleteUrl =>
				AppPath(KeyUrl("VCNVISITANTEdelete", UrlParm())); // DN

			// Add master URL
			public string AddMasterUrl(string url) {
				return url;
			}

			// Get primary key as JSON
			public string KeyToJson() {
				string json = "";
				json += "OID:" + ConvertToJson(OID.CurrentValue, "number", true);
				return "{" + json + "}";
			}

			// Add key value to URL
			public string KeyUrl(string url, string parm = "") { // DN
				if (!IsDBNull(OID.CurrentValue)) {
					url += "/" + OID.CurrentValue;
				} else {
					return "javascript:ew.alert(ew.language.phrase('InvalidRecord'));";
				}
				if (Empty(parm))
					return url;
				else
					return url + "?" + parm;
			}

			// Sort URL (already URL-encoded)
			public string SortUrl(DbField fld) {
				if (!Empty(CurrentAction) || !Empty(Export) ||
					(new List<int> {141, 201, 203, 128, 204, 205}).Contains(fld.Type)) { // Unsortable data type
					return "";
				} else if (fld.Sortable) {
					string urlParm = UrlParm("order=" + UrlEncode(fld.Name) + "&amp;ordertype=" + fld.ReverseSort());
					return AddMasterUrl(CurrentPageName() + "?" + urlParm);
				}
				return "";
			}

			#pragma warning disable 168

			// Get record keys
			public List<string> GetRecordKeys() {
				var result = new List<string>();
				StringValues sv;
				var keysList = new List<string>();
				if (Form.TryGetValue("key_m", out sv) || Query.TryGetValue("key_m", out sv)) {
					keysList = sv.ToList();
				} else if (RouteValues.Count > 0 || Query.Count > 0 || Form.Count > 0) { // DN
					string key = "";
					string[] keyValues = null;
					object rv;
					if (IsApi() && RouteValues.TryGetValue("key", out object k))
						keyValues = k.ToString().Split('/');
					if (RouteValues.TryGetValue("OID", out rv)) { // OID
						key = Convert.ToString(rv);
					} else if (IsApi() && !Empty(keyValues)) {
						key = keyValues[0];
					} else {
						key = Param("OID");
					}
					keysList.Add(key);
				}

				// Check keys
				foreach (var keys in keysList) {
					if (!IsNumeric(keys)) // OID
						continue;
					result.Add(keys);
				}
				return result;
			}

			#pragma warning restore 168

			// Get filter from record keys
			public string GetFilterFromRecordKeys() {
				List<string> recordKeys = GetRecordKeys();
				string keyFilter = "";
				foreach (var keys in recordKeys) {
					if (!Empty(keyFilter))
						keyFilter += " OR ";
					OID.CurrentValue = keys;
					keyFilter += "(" + GetRecordFilter() + ")";
				}
				return keyFilter;
			}

			#pragma warning disable 618

			// Load rows based on filter // DN
			public async Task<DbDataReader> LoadRs(string filter, DatabaseConnectionBase<SqlConnection, SqlCommand, SqlDataReader, SqlDbType> conn = null) {

				// Set up filter (SQL WHERE clause) and get return SQL
				string sql = GetSql(filter);
				try {
					var dr = await (conn ?? Connection).OpenDataReaderAsync(sql);
					if (dr?.HasRows ?? false)
						return dr;
				} catch {}
				return null;
			}

			#pragma warning restore 618

			// Record filter WHERE clause
			private string _sqlKeyFilter => "[OID] = @OID@";

			#pragma warning disable 168

			// Get record filter
			public string GetRecordFilter(Dictionary<string, object> row = null)
			{
				string keyFilter = _sqlKeyFilter;
				object val, result;
				val = !Empty(row) ? (row.TryGetValue("OID", out result) ? result : null) : OID.CurrentValue;
				if (!IsNumeric(val))
					return "0=1"; // Invalid key
				if (val == null)
					return "0=1"; // Invalid key
				else
					keyFilter = keyFilter.Replace("@OID@", AdjustSql(val, DbId)); // Replace key value
				return keyFilter;
			}

			#pragma warning restore 168

			// Load row values from recordset
			public void LoadListRowValues(DbDataReader rs) {
				OID.SetDbValue(rs["OID"]);
				VTEDOCUMENTO.SetDbValue(rs["VTEDOCUMENTO"]);
				VTETIPODOCUM.SetDbValue(rs["VTETIPODOCUM"]);
				VTEPRINOM.SetDbValue(rs["VTEPRINOM"]);
				VTESEGNOM.SetDbValue(rs["VTESEGNOM"]);
				VTEPRIAPE.SetDbValue(rs["VTEPRIAPE"]);
				VTESEGAPE.SetDbValue(rs["VTESEGAPE"]);
				VTEGENERO.SetDbValue(rs["VTEGENERO"]);
				VTEFOTO.Upload.DbValue = rs["VTEFOTO"];
				OptimisticLockField.SetDbValue(rs["OptimisticLockField"]);
			}

			#pragma warning disable 1998

			// Render list row values
			public async Task RenderListRow() {

				// Call Row Rendering event
				Row_Rendering();

				// Common render codes
				// OID
				// VTEDOCUMENTO
				// VTETIPODOCUM
				// VTEPRINOM
				// VTESEGNOM
				// VTEPRIAPE
				// VTESEGAPE
				// VTEGENERO
				// VTEFOTO
				// OptimisticLockField
				// OID

				OID.ViewValue = OID.CurrentValue;

				// VTEDOCUMENTO
				VTEDOCUMENTO.ViewValue = VTEDOCUMENTO.CurrentValue;

				// VTETIPODOCUM
				VTETIPODOCUM.ViewValue = VTETIPODOCUM.CurrentValue;
				VTETIPODOCUM.ViewValue = FormatNumber(VTETIPODOCUM.ViewValue, 0, -2, -2, -2);

				// VTEPRINOM
				VTEPRINOM.ViewValue = VTEPRINOM.CurrentValue;

				// VTESEGNOM
				VTESEGNOM.ViewValue = VTESEGNOM.CurrentValue;

				// VTEPRIAPE
				VTEPRIAPE.ViewValue = VTEPRIAPE.CurrentValue;

				// VTESEGAPE
				VTESEGAPE.ViewValue = VTESEGAPE.CurrentValue;

				// VTEGENERO
				VTEGENERO.ViewValue = VTEGENERO.CurrentValue;
				VTEGENERO.ViewValue = FormatNumber(VTEGENERO.ViewValue, 0, -2, -2, -2);

				// VTEFOTO
				if (!IsDBNull(VTEFOTO.Upload.DbValue)) {
					VTEFOTO.ViewValue = OID.CurrentValue;
					VTEFOTO.IsBlobImage = IsImageFile(ContentExtension((byte[])VTEFOTO.Upload.DbValue));
				} else {
					VTEFOTO.ViewValue = "";
				}

				// OptimisticLockField
				OptimisticLockField.ViewValue = OptimisticLockField.CurrentValue;
				OptimisticLockField.ViewValue = FormatNumber(OptimisticLockField.ViewValue, 0, -2, -2, -2);

				// OID
				OID.HrefValue = "";
				OID.TooltipValue = "";

				// VTEDOCUMENTO
				VTEDOCUMENTO.HrefValue = "";
				VTEDOCUMENTO.TooltipValue = "";

				// VTETIPODOCUM
				VTETIPODOCUM.HrefValue = "";
				VTETIPODOCUM.TooltipValue = "";

				// VTEPRINOM
				VTEPRINOM.HrefValue = "";
				VTEPRINOM.TooltipValue = "";

				// VTESEGNOM
				VTESEGNOM.HrefValue = "";
				VTESEGNOM.TooltipValue = "";

				// VTEPRIAPE
				VTEPRIAPE.HrefValue = "";
				VTEPRIAPE.TooltipValue = "";

				// VTESEGAPE
				VTESEGAPE.HrefValue = "";
				VTESEGAPE.TooltipValue = "";

				// VTEGENERO
				VTEGENERO.HrefValue = "";
				VTEGENERO.TooltipValue = "";

				// VTEFOTO
				if (!IsDBNull(VTEFOTO.Upload.DbValue)) {
					VTEFOTO.HrefValue = AppPath(GetFileUploadUrl(VTEFOTO, Convert.ToString(OID.CurrentValue)));
					VTEFOTO.LinkAttrs["target"] = "";
					if (VTEFOTO.IsBlobImage && Empty(VTEFOTO.LinkAttrs["target"]))
						VTEFOTO.LinkAttrs["target"] = "_blank";
					if (IsExport())
						VTEFOTO.HrefValue = FullUrl(Convert.ToString(VTEFOTO.HrefValue), "href");
				} else {
					VTEFOTO.HrefValue = "";
				}
				VTEFOTO.ExportHrefValue = GetFileUploadUrl(VTEFOTO, Convert.ToString(OID.CurrentValue));
				VTEFOTO.TooltipValue = "";

				// OptimisticLockField
				OptimisticLockField.HrefValue = "";
				OptimisticLockField.TooltipValue = "";

				// Call Row Rendered event
				Row_Rendered();

				// Save data for Custom Template
				Rows.Add(CustomTemplateFieldValues());
			}

			#pragma warning restore 1998

			#pragma warning disable 1998

			// Render edit row values
			public async Task RenderEditRow() {

				// Call Row Rendering event
				Row_Rendering();

				// OID
				OID.EditAttrs["class"] = "form-control";
				OID.EditValue = OID.CurrentValue;

				// VTEDOCUMENTO
				VTEDOCUMENTO.EditAttrs["class"] = "form-control";
				VTEDOCUMENTO.EditValue = VTEDOCUMENTO.CurrentValue; // DN
				VTEDOCUMENTO.PlaceHolder = RemoveHtml(VTEDOCUMENTO.Caption);

				// VTETIPODOCUM
				VTETIPODOCUM.EditAttrs["class"] = "form-control";
				VTETIPODOCUM.EditValue = VTETIPODOCUM.CurrentValue; // DN
				VTETIPODOCUM.PlaceHolder = RemoveHtml(VTETIPODOCUM.Caption);

				// VTEPRINOM
				VTEPRINOM.EditAttrs["class"] = "form-control";
				VTEPRINOM.EditValue = VTEPRINOM.CurrentValue; // DN
				VTEPRINOM.PlaceHolder = RemoveHtml(VTEPRINOM.Caption);

				// VTESEGNOM
				VTESEGNOM.EditAttrs["class"] = "form-control";
				VTESEGNOM.EditValue = VTESEGNOM.CurrentValue; // DN
				VTESEGNOM.PlaceHolder = RemoveHtml(VTESEGNOM.Caption);

				// VTEPRIAPE
				VTEPRIAPE.EditAttrs["class"] = "form-control";
				VTEPRIAPE.EditValue = VTEPRIAPE.CurrentValue; // DN
				VTEPRIAPE.PlaceHolder = RemoveHtml(VTEPRIAPE.Caption);

				// VTESEGAPE
				VTESEGAPE.EditAttrs["class"] = "form-control";
				VTESEGAPE.EditValue = VTESEGAPE.CurrentValue; // DN
				VTESEGAPE.PlaceHolder = RemoveHtml(VTESEGAPE.Caption);

				// VTEGENERO
				VTEGENERO.EditAttrs["class"] = "form-control";
				VTEGENERO.EditValue = VTEGENERO.CurrentValue; // DN
				VTEGENERO.PlaceHolder = RemoveHtml(VTEGENERO.Caption);

				// VTEFOTO
				VTEFOTO.EditAttrs["class"] = "form-control";
				if (!IsDBNull(VTEFOTO.Upload.DbValue)) {
					VTEFOTO.EditValue = OID.CurrentValue;
					VTEFOTO.IsBlobImage = IsImageFile(ContentExtension((byte[])VTEFOTO.Upload.DbValue));
				} else {
					VTEFOTO.EditValue = "";
				}

				// OptimisticLockField
				OptimisticLockField.EditAttrs["class"] = "form-control";
				OptimisticLockField.EditValue = OptimisticLockField.CurrentValue; // DN
				OptimisticLockField.PlaceHolder = RemoveHtml(OptimisticLockField.Caption);

				// Call Row Rendered event
				Row_Rendered();
			}

			#pragma warning restore 1998

			// Aggregate list row values
			public void AggregateListRowValues() {
			}

			#pragma warning disable 1998

			// Aggregate list row (for rendering)
			public async Task AggregateListRow() {

				// Call Row Rendered event
				Row_Rendered();
			}

			#pragma warning restore 1998

			// Export document
			public dynamic ExportDoc;

			// Export data in HTML/CSV/Word/Excel/Email/PDF format
			public async Task ExportDocument(dynamic doc, DbDataReader dataReader, int startRec, int stopRec, string exportType = "") {
				if (dataReader == null || doc == null)
					return;
				if (!doc.ExportCustom) {

					// Write header
					doc.ExportTableHeader();
					if (doc.Horizontal) { // Horizontal format, write header
						doc.BeginExportRow();
						if (exportType == "view") {
							doc.ExportCaption(OID);
							doc.ExportCaption(VTEDOCUMENTO);
							doc.ExportCaption(VTETIPODOCUM);
							doc.ExportCaption(VTEPRINOM);
							doc.ExportCaption(VTESEGNOM);
							doc.ExportCaption(VTEPRIAPE);
							doc.ExportCaption(VTESEGAPE);
							doc.ExportCaption(VTEGENERO);
							doc.ExportCaption(VTEFOTO);
							doc.ExportCaption(OptimisticLockField);
						} else {
							doc.ExportCaption(OID);
							doc.ExportCaption(VTEDOCUMENTO);
							doc.ExportCaption(VTETIPODOCUM);
							doc.ExportCaption(VTEPRINOM);
							doc.ExportCaption(VTESEGNOM);
							doc.ExportCaption(VTEPRIAPE);
							doc.ExportCaption(VTESEGAPE);
							doc.ExportCaption(VTEGENERO);
							doc.ExportCaption(OptimisticLockField);
						}
						doc.EndExportRow();
					}
				}

				// Move to first record
				// For List page only. For View page, the recordset is alreay at the start record. // DN

				int recCnt = startRec - 1;
				if (exportType != "view") {
					if (Connection.SelectOffset) {
						await dataReader.ReadAsync();
					} else {
						for (int i = 0; i < startRec; i++) // Move to the start record and use do-while loop
							await dataReader.ReadAsync();
					}
				}
				int rowcnt = 0; // DN
				do { // DN
					recCnt++;
					if (recCnt >= startRec) {
						rowcnt = recCnt - startRec + 1;

						// Page break
						if (ExportPageBreakCount > 0) {
							if (rowcnt > 1 && (rowcnt - 1) % ExportPageBreakCount == 0)
								doc.ExportPageBreak();
						}
						LoadListRowValues(dataReader);

						// Render row
						RowType = Config.RowTypeView; // Render view
						ResetAttributes();
						await RenderListRow();
						if (!doc.ExportCustom) {
							doc.BeginExportRow(rowcnt); // Allow CSS styles if enabled
							if (exportType == "view") {
								await doc.ExportField(OID);
								await doc.ExportField(VTEDOCUMENTO);
								await doc.ExportField(VTETIPODOCUM);
								await doc.ExportField(VTEPRINOM);
								await doc.ExportField(VTESEGNOM);
								await doc.ExportField(VTEPRIAPE);
								await doc.ExportField(VTESEGAPE);
								await doc.ExportField(VTEGENERO);
								await doc.ExportField(VTEFOTO);
								await doc.ExportField(OptimisticLockField);
							} else {
								await doc.ExportField(OID);
								await doc.ExportField(VTEDOCUMENTO);
								await doc.ExportField(VTETIPODOCUM);
								await doc.ExportField(VTEPRINOM);
								await doc.ExportField(VTESEGNOM);
								await doc.ExportField(VTEPRIAPE);
								await doc.ExportField(VTESEGAPE);
								await doc.ExportField(VTEGENERO);
								await doc.ExportField(OptimisticLockField);
							}
							doc.EndExportRow(rowcnt);
						}
					}

					// Call Row Export server event
					if (doc.ExportCustom)
						Row_Export(dataReader);
				} while (recCnt < stopRec && await dataReader.ReadAsync()); // DN
				if (!doc.ExportCustom)
					doc.ExportTableFooter();
			}

			#pragma warning disable 219

			// Lookup data from table
			public async Task<JsonBoolResult> Lookup() {
				Language = Language ?? new Lang(Config.LanguageFolder, Post("language"));

				// Load lookup parameters
				bool distinct = Post<bool>("distinct");
				string linkField = Post("linkField");
				StringValues sv;
				var displayFields = Form.TryGetValue("displayFields[]", out sv) ? sv.ToList() : new List<string>();
				var parentFields = Form.TryGetValue("parentFields[]", out sv) ? sv.ToList() : new List<string>();
				var childFields = Form.TryGetValue("childFields[]", out sv) ? sv.ToList() : new List<string>();
				var filterFields = Form.TryGetValue("filterFields[]", out sv) ? sv.ToList() : new List<string>();
				var filterFieldVars = Form.TryGetValue("filterFieldVars[]", out sv) ? sv.ToList() : new List<string>();
				var filterOperators = Form.TryGetValue("filterOperators[]", out sv) ? sv.ToList() : new List<string>();
				var autoFillSourceFields = Form.TryGetValue("autoFillSourceFields[]", out sv) ? sv.ToList() : new List<string>();
				bool formatAutoFill = false;
				string lookupType = Post("ajax");
				int pageSize = -1;
				int offset = -1;
				string searchValue = "";
				if (SameText(lookupType, "modal")) {
					searchValue = Post("sv");
					if (Empty(Post("recperpage")))
						pageSize = 10;
					else
						pageSize = Post<int>("recperpage");
					offset = Post<int>("start");
				} else if (SameText(lookupType, "autosuggest")) {
					searchValue = Get("q");
					pageSize = IsNumeric(Param("n")) ? Param<int>("n") : -1;
					if (pageSize <= 0)
						pageSize = Config.AutoSuggestMaxEntries;
					int start = IsNumeric(Param("start")) ? Param<int>("start") : -1;
					int page = IsNumeric(Param("page")) ? Param<int>("page") : -1;
					offset = start >= 0 ? start : (page > 0 && pageSize > 0 ? (page - 1) * pageSize : 0);
				}
				string userSelect = Decrypt(Post("s"));
				string userFilter = Decrypt(Post("f"));
				string userOrderBy = Decrypt(Post("o"));

				// Selected records from modal, skip parent/filter fields and show all records
				StringValues keys;
				if (Form.TryGetValue("keys[]", out keys)) { // Selected records from modal
					parentFields = new List<string>();
					filterFields = new List<string>();
					filterFieldVars = new List<string>();
					offset = -1;
					pageSize = -1;
				}

				// Create lookup object and output JSON
				var lookup = new Lookup(linkField, TableVar, distinct, linkField, displayFields, parentFields, childFields, filterFields, filterFieldVars, autoFillSourceFields);
				for (int i = 0; i < filterFields.Count; i++) { // Set up filter operators
					if (!Empty(filterOperators[i]))
						lookup.SetFilterOperator(filterFields[i], filterOperators[i]);
				}
				lookup.LookupType = lookupType; // Lookup type
				if (!StringValues.IsNullOrEmpty(keys)) { // Selected records from modal
					lookup.FilterValues.Add(string.Join(",", keys.ToArray()));
				} else { // Lookup values
					lookup.FilterValues.Add(Post<string>("v0") ?? Post("lookupValue"));
				}
				int cnt = IsList(filterFields) ? filterFields.Count : 0;
				for (int i = 1; i <= cnt; i++)
					lookup.FilterValues.Add(UrlDecode(Post("v" + i)));
				lookup.SearchValue = searchValue;
				lookup.PageSize = pageSize;
				lookup.Offset = offset;
				if (userSelect != "")
					lookup.UserSelect = userSelect;
				if (userFilter != "")
					lookup.UserFilter = userFilter;
				if (userOrderBy != "")
					lookup.UserOrderBy = userOrderBy;
				return await lookup.ToJson();
			}

			#pragma warning restore 219

			// Table filter
			private string _tableFilter = null;
			public string TableFilter {
				get => _tableFilter ?? "";
				set => _tableFilter = value;
			}

			// TblBasicSearchDefault
			private string _tableBasicSearchDefault = null;
			public string TableBasicSearchDefault {
				get => _tableBasicSearchDefault ?? "";
				set => _tableBasicSearchDefault = value;
			}

			#pragma warning disable 1998

			// Get file data
			public async Task<IActionResult> GetFileData(string fldparm, string key, bool resize, int width = -1, int height = -1) {
				if (width < 0)
					width = Config.ThumbnailDefaultWidth;
				if (height < 0)
					height = Config.ThumbnailDefaultHeight;

				// Set up field names
				string fldName = "", fileNameFld = "", fileTypeFld = "";
				if (SameText(fldparm, "VTEFOTO")) {
					fldName = "VTEFOTO";
				} else {
					return JsonBoolResult.FalseResult; // Incorrect field
				}

				// Set up key values
				var ar = key.Split(Convert.ToChar(Config.CompositeKeySeparator));
				if (ar.Length == 1) {
					OID.CurrentValue = ar[0];
				} else {
					return JsonBoolResult.FalseResult; // Incorrect key
				}

				// Set up filter (WHERE Clause)
				string filter = GetRecordFilter();
				CurrentFilter = filter;
				string sql = CurrentSql;
				using (var rs = await Connection.GetDataReaderAsync(sql)) {
					if (rs != null && await rs.ReadAsync()) {
						var val = rs[fldName];
						if (!Empty(val)) {

							// Binary data
							if (Fields.TryGetValue(fldName, out DbField fld) && fld.IsBlob) {
								byte[] data = (byte[])val;
								if (resize && data.Length > 0)
									ResizeBinary(ref data, ref width, ref height);
								string contentType = "";

								// Write file type
								if (!Empty(fileTypeFld) && !Empty(rs[fileTypeFld]))
									contentType = Convert.ToString(rs[fileTypeFld]);
								else
									contentType = ContentType(data);

								// Write file data
								if (data.Take(8).SequenceEqual(new byte[] {0x50, 0x4B, 0x03, 0x04, 0x14, 0x00, 0x06, 0x00}) && // Fix Office 2007 documents
									!data.TakeLast(4).SequenceEqual(new byte[] {0x00, 0x00, 0x00, 0x00}))
										data.Concat(new byte[] {0x00, 0x00, 0x00, 0x00});

								// Clear any debug message
								// Response.Clear();
								// Return file content result // DN

								if (!Empty(fileNameFld) && !Empty(rs[fileNameFld]))
									return Controller.File(data, contentType, Convert.ToString(rs[fileNameFld]));
								else
									return Controller.File(data, contentType);

							// Upload to folder
							} else {
								List<string> files;
								if (fld.UploadMultiple)
									files = Convert.ToString(val).Split(Config.MultipleUploadSeparator).ToList();
								else
									files = new List<string> { Convert.ToString(val) };
								var result = files.ToDictionary(f => f, f => FullUrl(fld.HrefPath + f));
								return new JsonBoolResult(new Dictionary<string, object> { { fld.Param, result } }, true);
							}
						}
					}
				}
				return JsonBoolResult.FalseResult; // Incorrect key
			}

			#pragma warning restore 1998

			// Table level events
			// Recordset Selecting event

			public void Recordset_Selecting(ref string filter) {

				// Enter your code here
			}

			// Recordset Search Validated event
			public void Recordset_SearchValidated() {

				// Enter your code here
			}

			// Recordset Searching event
			public void Recordset_Searching(ref string filter) {

				// Enter your code here
			}

			// Row_Selecting event
			public void Row_Selecting(ref string filter) {

				// Enter your code here
			}

			// Row Selected event
			public void Row_Selected(Dictionary<string, object> row) {

				//Log("Row Selected");
			}

			// Row Inserting event
			public bool Row_Inserting(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				// Enter your code here
				// To cancel, set return value to False and error message to CancelMessage

				return true;
			}

			// Row Inserted event
			public void Row_Inserted(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				//Log("Row Inserted");
			}

			// Row Updating event
			public bool Row_Updating(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				// Enter your code here
				// To cancel, set return value to False and error message to CancelMessage

				return true;
			}

			// Row Updated event
			public void Row_Updated(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				//Log("Row Updated");
			}

			// Row Update Conflict event
			public bool Row_UpdateConflict(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				// Enter your code here
				// To ignore conflict, set return value to false

				return true;
			}

			// Row Export event
			// ExportDoc = export document object

			public virtual void Row_Export(DbDataReader rs) {

				//ExportDoc.Text.Append("<div>" + MyField.ViewValue +"</div>"); // Build HTML with field value: rs["MyField"] or MyField.ViewValue
			}

			// Page Exporting event
			// ExportDoc = export document object

			public virtual bool Page_Exporting() {

				//ExportDoc.Text.Append("<p>" + "my header" + "</p>"); // Export header
				//return false; // Return FALSE to skip default export and use Row_Export event

				return true; // Return TRUE to use default export and skip Row_Export event
			}

			// Page Exported event
			// ExportDoc = export document object

			public virtual void Page_Exported() {

				//ExportDoc.Text.Append("my footer"); // Export footer
				//Log("Text: {Text}", ExportDoc.Text);

			}

			// Recordset Deleting event
			public bool Row_Deleting(Dictionary<string, object> rs) {

				// Enter your code here
				// To cancel, set return value to False and error message to CancelMessage

				return true;
			}

			// Row Deleted event
			public void Row_Deleted(Dictionary<string, object> rs) {

				//Log("Row Deleted");
			}

			// Email Sending event
			public virtual bool Email_Sending(Email email, dynamic args) {

				//Log(email);
				return true;
			}

			// Lookup Selecting event
			public void Lookup_Selecting(DbField fld, ref string filter) {

				// Enter your code here
			}

			// Row Rendering event
			public void Row_Rendering() {

				// Enter your code here
			}

			// Row Rendered event
			public void Row_Rendered() {

				//VarDump(<FieldName>); // View field properties
			}

			// User ID Filtering event
			public void UserID_Filtering(ref string filter) {

				// Enter your code here
			}
		}
	}
}
