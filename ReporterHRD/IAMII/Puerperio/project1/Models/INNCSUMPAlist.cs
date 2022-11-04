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

// Models
namespace AspNetMaker2019.Models {

	// Partial class
	public partial class project1 {

		/// <summary>
		/// INNCSUMPA_List
		/// </summary>

		public static _INNCSUMPA_List INNCSUMPA_List {
			get => HttpData.Get<_INNCSUMPA_List>("INNCSUMPA_List");
			set => HttpData["INNCSUMPA_List"] = value;
		}

		/// <summary>
		/// Page class for INNCSUMPA
		/// </summary>

		public class _INNCSUMPA_List : _INNCSUMPA_ListBase
		{

			// Construtor
			public _INNCSUMPA_List(Controller controller = null) : base(controller) {
			}
		}

		/// <summary>
		/// Page base class
		/// </summary>

		public class _INNCSUMPA_ListBase : _INNCSUMPA, IAspNetMakerPage
		{

			// Page ID
			public string PageID = "list";

			// Project ID
			public string ProjectID = "{3DC5054A-CA8A-4B9E-84E7-55994334EA5F}";

			// Table name
			public string TableName = "INNCSUMPA";

			// Page object name
			public string PageObjName = "INNCSUMPA_List";

			// Grid form hidden field names
			public string FormName = "fINNCSUMPAlist";
			public string FormActionName = "k_action";
			public string FormKeyName = "k_key";
			public string FormOldKeyName = "k_oldkey";
			public string FormBlankRowName = "k_blankrow";
			public string FormKeyCountName = "key_count";

			// Page headings
			public string Heading = "";
			public string Subheading = "";
			public string PageHeader = "";
			public string PageFooter = "";

			// Token
			public string Token; // DN
			public bool CheckToken = Config.CheckToken;

			// Action result // DN
			public IActionResult ActionResult;

			// Cache // DN
			public IMemoryCache Cache;

			// Page terminated // DN
			private bool _terminated = false;

			// Page action result
			public IActionResult PageResult() {
				if (ActionResult != null)
					return ActionResult;
				SetupMenus();
				return Controller.View();
			}

			// Page heading
			public string PageHeading {
				get {
					if (!Empty(Heading))
						return Heading;
					else if (!Empty(Caption))
						return Caption;
					else
						return "";
				}
			}

			// Page subheading
			public string PageSubheading {
				get {
					if (!Empty(Subheading))
						return Subheading;
					if (!Empty(TableName))
						return Language.Phrase(PageID);
					return "";
				}
			}

			// Page name
			public string PageName => CurrentPageName();

			// Page URL
			public string PageUrl => CurrentPageName() + "?";

			// Export URLs
			public string ExportPrintUrl = "";
			public string ExportHtmlUrl = "";
			public string ExportExcelUrl = "";
			public string ExportWordUrl = "";
			public string ExportXmlUrl = "";
			public string ExportCsvUrl = "";
			public string ExportPdfUrl = "";

			// Update URLs
			public string InlineAddUrl = "";
			public string GridAddUrl = "";
			public string GridEditUrl = "";
			public string MultiDeleteUrl = "";
			public string MultiUpdateUrl = "";

			// Custom export
			public bool ExportExcelCustom = false;
			public bool ExportWordCustom = false;
			public bool ExportPdfCustom = false;
			public bool ExportEmailCustom = false;

			// Private properties
			private string _message = "";
			private string _failureMessage = "";
			private string _successMessage = "";
			private string _warningMessage = "";

			// Message
			public string Message {
				get => Session.TryGetValue(Config.SessionMessage, out string message) ? message : _message;
				set {
					_message = AddMessage(Message, value);
					Session[Config.SessionMessage] = _message;
				}
			}

			// Failure Message
			public string FailureMessage {
				get => Session.TryGetValue(Config.SessionFailureMessage, out string failureMessage) ? failureMessage : _failureMessage;
				set {
					_failureMessage = AddMessage(FailureMessage, value);
					Session[Config.SessionFailureMessage] = _failureMessage;
				}
			}

			// Success Message
			public string SuccessMessage {
				get => Session.TryGetValue(Config.SessionSuccessMessage, out string successMessage) ? successMessage : _successMessage;
				set {
					_successMessage = AddMessage(SuccessMessage, value);
					Session[Config.SessionSuccessMessage] = _successMessage;
				}
			}

			// Warning Message
			public string WarningMessage {
				get => Session.TryGetValue(Config.SessionWarningMessage, out string warningMessage) ? warningMessage : _warningMessage;
				set {
					_warningMessage = AddMessage(WarningMessage, value);
					Session[Config.SessionWarningMessage] = _warningMessage;
				}
			}

			// Clear message
			public void ClearMessage() {
				_message = "";
				Session[Config.SessionMessage] = _message;
			}

			// Clear failure message
			public void ClearFailureMessage() {
				_failureMessage = "";
				Session[Config.SessionFailureMessage] = _failureMessage;
			}

			// Clear success message
			public void ClearSuccessMessage() {
				_successMessage = "";
				Session[Config.SessionSuccessMessage] = _successMessage;
			}

			// Clear warning message
			public void ClearWarningMessage() {
				_warningMessage = "";
				Session[Config.SessionWarningMessage] = _warningMessage;
			}

			// Clear all messages
			public void ClearMessages() {
				ClearMessage();
				ClearFailureMessage();
				ClearSuccessMessage();
				ClearWarningMessage();
			}

			// Get message
			public string GetMessage() { // DN
				bool hidden = false;
				string html = "";

				// Message
				string message = Message;
				Message_Showing(ref message, "");
				if (!Empty(message)) { // Message in Session, display
					if (!hidden)
						message = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" + message;
					html += "<div class=\"alert alert-info alert-dismissible ew-info\"><i class=\"icon fa fa-info\"></i>" + message + "</div>";
					Session[Config.SessionMessage] = ""; // Clear message in Session
				}

				// Warning message
				string warningMessage = WarningMessage;
				Message_Showing(ref warningMessage, "warning");
				if (!Empty(warningMessage)) { // Message in Session, display
					if (!hidden)
						warningMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" + warningMessage;
					html += "<div class=\"alert alert-warning alert-dismissible ew-warning\"><i class=\"icon fa fa-warning\"></i>" + warningMessage + "</div>";
					Session[Config.SessionWarningMessage] = ""; // Clear message in Session
				}

				// Success message
				string successMessage = SuccessMessage;
				Message_Showing(ref successMessage, "success");
				if (!Empty(successMessage)) { // Message in Session, display
					if (!hidden)
						successMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" + successMessage;
					html += "<div class=\"alert alert-success alert-dismissible ew-success\"><i class=\"icon fa fa-check\"></i>" + successMessage + "</div>";
					Session[Config.SessionSuccessMessage] = ""; // Clear message in Session
				}

				// Failure message
				string errorMessage = FailureMessage;
				Message_Showing(ref errorMessage, "failure");
				if (!Empty(errorMessage)) { // Message in Session, display
					if (!hidden)
						errorMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" + errorMessage;
					html += "<div class=\"alert alert-danger alert-dismissible ew-error\"><i class=\"icon fa fa-ban\"></i>" + errorMessage + "</div>";
					Session[Config.SessionFailureMessage] = ""; // Clear message in Session
				}
				return "<div class=\"ew-message-dialog\"" + (hidden ? " d-none" : "") + ">" + html + "</div>"; // DN
			}

			// Show message as IHtmlContent // DN
			public IHtmlContent ShowMessages() => new HtmlString(GetMessage());

			// Get messages
			public Dictionary<string, string> GetMessages() {
				var d = new Dictionary<string, string>();

				// Message
				string message = Message;
				if (!Empty(message)) { // Message in Session, display
					d.Add("message", message);
					Session[Config.SessionMessage] = ""; // Clear message in Session
				}

				// Warning message
				string warningMessage = WarningMessage;
				if (!Empty(warningMessage)) { // Message in Session, display
					d.Add("warningMessage", warningMessage);
					Session[Config.SessionWarningMessage] = ""; // Clear message in Session
				}

				// Success message
				string successMessage = SuccessMessage;
				if (!Empty(successMessage)) { // Message in Session, display
					d.Add("successMessage", successMessage);
					Session[Config.SessionSuccessMessage] = ""; // Clear message in Session
				}

				// Failure message
				string failureMessage = FailureMessage;
				if (!Empty(failureMessage)) { // Message in Session, display
					d.Add("failureMessage", failureMessage);
					Session[Config.SessionFailureMessage] = ""; // Clear message in Session
				}
				return d;
			}

			// Show Page Header
			public IHtmlContent ShowPageHeader() {
				string header = PageHeader;
				Page_DataRendering(ref header);
				if (!Empty(header)) // Header exists, display
					return new HtmlString("<p id=\"ew-page-header\">" + header + "</p>");
				return null;
			}

			// Show Page Footer
			public IHtmlContent ShowPageFooter() {
				string footer = PageFooter;
				Page_DataRendered(ref footer);
				if (!Empty(footer)) // Footer exists, display
					return new HtmlString("<p id=\"ew-page-footer\">" + footer + "</p>");
				return null;
			}

			// Validate page request
			public bool IsPageRequest => true;

			// Valid post
			protected async Task<bool> ValidPost() => !CheckToken || !IsPost() || IsApi() || await Antiforgery.IsRequestValidAsync(HttpContext);

			// Create token
			public void CreateToken() {
				Token = Token ?? Antiforgery.GetTokens(HttpContext).RequestToken; // Always create token, required by API file/lookup request
				CurrentToken = Token; // Save to global variable
			}

			// Constructor
			public _INNCSUMPA_ListBase(Controller controller = null) { // DN
				if (controller != null)
					Controller = controller;

				// Initialize
				CurrentPage = this;

				// Language object
				Language = Language ?? new Lang();

				// Table object (INNCSUMPA)
				if (INNCSUMPA == null || INNCSUMPA is _INNCSUMPA)
					INNCSUMPA = this;

				// Initialize URLs
				ExportPrintUrl = PageUrl + "export=print";
				ExportExcelUrl = PageUrl + "export=excel";
				ExportWordUrl = PageUrl + "export=word";
				ExportHtmlUrl = PageUrl + "export=html";
				ExportXmlUrl = PageUrl + "export=xml";
				ExportCsvUrl = PageUrl + "export=csv";
				ExportPdfUrl = PageUrl + "export=pdf";
				AddUrl = "INNCSUMPAadd";
				InlineAddUrl = PageUrl + "action=add";
				GridAddUrl = PageUrl + "action=gridadd";
				GridEditUrl = PageUrl + "action=gridedit";
				MultiDeleteUrl = "INNCSUMPAdelete";
				MultiUpdateUrl = "INNCSUMPAupdate";

				// Start time
				StartTime = Environment.TickCount;

				// Debug message
				LoadDebugMessage();

				// Open connection
				Conn = Connection; // DN

				// List options
				ListOptions = new ListOptions { TableVar = TableVar };

				// Export options
				ExportOptions = new ListOptions { Tag = "div", TagClassName = "ew-export-option" };

				// Import options
				ImportOptions = new ListOptions { Tag = "div", TagClassName = "ew-import-option" };

				// Other options
				OtherOptions["addedit"] = new ListOptions { Tag = "div", TagClassName = "ew-add-edit-option" };
				OtherOptions["detail"] = new ListOptions { Tag = "div", TagClassName = "ew-detail-option" };
				OtherOptions["action"] = new ListOptions { Tag = "div", TagClassName = "ew-action-option" };

				// Filter options
				FilterOptions = new ListOptions { Tag = "div", TagClassName = "ew-filter-option fINNCSUMPAlistsrch" };

				// List actions
				ListActions = new ListActions();
			}

			#pragma warning disable 1998

			// Export view result
			public async Task<IActionResult> ExportView() { // DN
				if (!Empty(CustomExport) && CustomExport == Export && Config.Export.TryGetValue(CustomExport, out string classname)) {
					IActionResult result = null;
					string content = await GetViewOutput();
					if (Empty(ExportFileName))
						ExportFileName = TableVar;
					dynamic doc = CreateInstance(classname, new object[] { INNCSUMPA, "" }); // DN
					doc.Text.Append(content);
					result = doc.Export();
					DeleteTempImages(); // Delete temp images
					return result;
				}
				return null;
			}

			#pragma warning restore 1998

			/// <summary>
			/// Terminate page
			/// </summary>
			/// <param name="url">URL to rediect to</param>
			/// <returns>Page result</returns>

			public IActionResult Terminate(string url = "") { // DN
				if (_terminated) // DN
					return null;

				// Page Unload event
				Page_Unload();

				// Global Page Unloaded event
				Page_Unloaded();
				if (!IsApi())
					Page_Redirecting(ref url);

				// Close connection
				CloseConnections(true);

				// Gargage collection
				Collect(); // DN

				// Terminate
				_terminated = true; // DN

				// Return for API
				if (IsApi()) {
					bool res = !Empty(url);
					if (!res) { // Show error
						var showError = new Dictionary<string, string> { { "success", "false" }, { "version", Config.ProductVersion } };
						foreach (var (key, value) in GetMessages())
							showError.Add(key, value);
						return Controller.Json(showError);
					}
				} else if (ActionResult != null) { // Check action result
					return ActionResult;
				}

				// Go to URL if specified
				if (!Empty(url)) {
					if (!Config.Debug)
						ResponseClear();
					if (!Response.HasStarted) {
						SaveDebugMessage();
						return Controller.LocalRedirect(AppPath(url));
					}
				}
				return null;
			}

			// Get all records from datareader
			protected async Task<List<Dictionary<string, object>>> GetRecordsFromRecordset(DbDataReader rs)
			{
				var rows = new List<Dictionary<string, object>>();
				while (rs != null && await rs.ReadAsync()) {
					await LoadRowValues(rs); // Set up DbValue/CurrentValue
					rows.Add(GetRecordFromDictionary(GetDictionary(rs)));
				}
				return rows;
			}

			// Get the first record from datareader
			protected async Task<Dictionary<string, object>> GetRecordFromRecordset(DbDataReader rs)
			{
				if (rs != null) {
					await LoadRowValues(rs); // Set up DbValue/CurrentValue
					return GetRecordFromDictionary(GetDictionary(rs));
				}
				return null;
			}

			// Get the first record from the list of records
			protected Dictionary<string, object> GetRecordFromRecordset(List<Dictionary<string, object>> ar) => GetRecordFromDictionary(ar[0]);

			// Get record from Dictionary
			protected Dictionary<string, object> GetRecordFromDictionary(Dictionary<string, object> ar) {
				var row = new Dictionary<string, object>();
				foreach (var (key, value) in ar) {
					if (Fields.TryGetValue(key, out DbField fld)) {
						if (fld.Visible || fld.IsPrimaryKey) { // Primary key or Visible
							if (fld.HtmlTag == "FILE") { // Upload field
								if (Empty(value)) {
									row[key] = null;
								} else {
									if (fld.DataType == Config.DataTypeBlob) {
										string url = FullUrl(GetPageName(Config.ApiUrl) + "/" + Config.ApiFileAction + "/" + fld.TableVar + "/" + fld.Param + "/" + GetRecordKeyValue(ar)); // Query string format
										row[key] = new Dictionary<string, object> { { "mimeType", ContentType((byte[])value) }, { "url", url } };
									} else if (!fld.UploadMultiple || !Convert.ToString(value).Contains(Config.MultipleUploadSeparator)) { // Single file
										row[key] = new Dictionary<string, object> { { "mimeType", ContentType(Convert.ToString(value)) }, { "url", FullUrl(fld.HrefPath + Convert.ToString(value)) } };
									} else { // Multiple files
										var files = Convert.ToString(value).Split(Config.MultipleUploadSeparator);
										row[key] = files.Where(file => !Empty(file)).Select(file => new Dictionary<string, object> { { "type", ContentType(file) }, { "url", FullUrl(fld.HrefPath + file) } });
									}
								}
							} else {
								row[key] = Convert.ToString(value);
							}
						}
					}
				}
				return row;
			}

			// Get record key value from array
			protected string GetRecordKeyValue(Dictionary<string, object> ar) {
				string key = "";
				key += UrlEncode(Convert.ToString(ar["OID"]));
				return key;
			}

			// Hide fields for Add/Edit
			protected void HideFieldsForAddEdit() {
			}

			// Class properties
			public ListOptions ListOptions; // List options
			public ListOptions ExportOptions; // Export options
			public ListOptions SearchOptions; // Search options
			public ListOptionsDictionary OtherOptions = new ListOptionsDictionary(); // Other options
			public ListOptions FilterOptions; // Filter options
			public ListOptions ImportOptions; // Import options
			public ListActions ListActions; // List actions
			public int SelectedCount = 0;
			public int SelectedIndex = 0;
			public int DisplayRecords = 20; // Number of display records
			public int StartRecord;
			public int StopRecord;
			public int TotalRecords = -1;
			public int RecordRange = 10;
			public dynamic Pager;
			public bool AutoHidePager = Config.AutoHidePager;
			public bool AutoHidePageSizeSelector = Config.AutoHidePageSizeSelector;
			public string DefaultSearchWhere = ""; // Default search WHERE clause
			public string SearchWhere = ""; // Search WHERE clause
			public int RecordCount = 0; // Record count
			public int EditRowCount;
			public int StartRowCount = 1;
			public Dictionary<int, dynamic> Attributes = new Dictionary<int, dynamic>(); // Row attributes and cell attributes
			public object RowIndex = 0; // Row index
			public int KeyCount = 0; // Key count
			public string RowAction = ""; // Row action
			public string RowOldKey = ""; // Row old key (for copy)
			public string MultiColumnClass = "col-sm";
			public string MultiColumnEditClass = "w-100";
			public int MultiColumnCount = 12;
			public int MultiColumnEditCount = 12;
			public string DbMasterFilter = ""; // Master filter
			public string DbDetailFilter = ""; // Detail filter
			public bool MasterRecordExists;
			public string MultiSelectKey = "";
			public bool RestoreSearch = false;
			public string HashValue; // Hash Value
			public SubPages DetailPages;
			public DbDataReader Recordset;
			public DbDataReader OldRecordset;

			/// <summary>
			/// Page run
			/// </summary>
			/// <returns>Page result</returns>

			public async Task<IActionResult> Run() {

				// Header
				Header(Config.Cache);

				// Create form object
				CurrentForm = new HttpForm();
				CurrentAction = Param("action"); // Set up current action

				// Get grid add count
				int gridaddcnt = Get<int>(Config.TableGridAddRowCount);
				if (gridaddcnt > 0)
					GridAddRowCount = gridaddcnt;

				// Set up list options
				await SetupListOptions();
				OID.SetVisibility();
				ADNINGRESO.SetVisibility();
				SLNORDSER.SetVisibility();
				ISCESTPRO.SetVisibility();
				GEENMedico.SetVisibility();
				INNALMACE.SetVisibility();
				GENARESER.SetVisibility();
				ISCDETALL.Visible = false;
				GENARESER1.SetVisibility();
				ISCSUMIORIGEN.SetVisibility();
				ISCSUMIPENDI.SetVisibility();
				INNORDDESC.SetVisibility();
				ISCSUMGENPEN.SetVisibility();
				ISCVRBASINC.SetVisibility();
				ISCPORINCRE.SetVisibility();
				ISCPORINCRE1.SetVisibility();
				ISCVALINCRE.SetVisibility();
				ISCVALINCRE1.SetVisibility();
				ISCOIDORIHCRE.SetVisibility();
				ISCTIPSOLDIS.SetVisibility();
				INNDISFORREC.SetVisibility();
				INNPENDICAB.SetVisibility();
				ISCINDIDESA.SetVisibility();
				ISCJUSTIFICA.SetVisibility();
				ISCFECORIGEN.SetVisibility();
				ISCGFMIDFOR.SetVisibility();
				INNCPLAPRO.SetVisibility();
				INNCCONFIR.SetVisibility();
				INNCAUTCONFCOMPEN.SetVisibility();
				INNCAUTANULCOMPEN.SetVisibility();
				ISCINTERCOMPEN.SetVisibility();
				ISCMEDREMICOMPEN.SetVisibility();
				ISCNUMMESCOMPEN.SetVisibility();
				HideFieldsForAddEdit();

				// Global Page Loading event
				Page_Loading();

				// Page Load event
				Page_Load();

				// Check token
				if (!await ValidPost())
					End(Language.Phrase("InvalidPostRequest"));

				// Create token
				CreateToken();

				// Setup other options
				SetupOtherOptions();

				// Set up custom action (compatible with old version)
				ListActions.Add(CustomActions);

				// Show checkbox column if multiple action
				if (ListActions.Items.Any(kvp => kvp.Value.Select == Config.ActionMultiple && kvp.Value.Allowed))
					ListOptions["checkbox"].Visible = true;

				// Set up lookup cache
				// Search filters

				string srchBasic = ""; // Basic search filter
				string filter = "";

				// Get command
				Command = Get("cmd").ToLower();
				if (IsPageRequest) { // Validate request

					// Process list action first
					var result = await ProcessListAction();
					if (result != null) // Ajax request
						return result;

					// Handle reset command
					ResetCommand();

					// Set up Breadcrumb
					if (!IsExport())
						SetupBreadcrumb();

					// Check QueryString parameters
					if (!Empty(Get("action"))) {
						CurrentAction = Get("action");

						// Clear inline mode
						if (IsCancel)
							ClearInlineMode();

						// Switch to grid edit mode
						if (IsGridEdit)
							GridEditMode();
					} else {
						if (!Empty(Post("action"))) {
							CurrentAction = Post("action"); // Get action
							var gridUpdate = false;

							// Grid Update
							if ((IsGridUpdate || IsGridOverwrite) && SameString(Session[Config.SessionInlineMode], "gridedit")) {
								if (await ValidateGridForm()) {
									gridUpdate = await GridUpdate();
								} else {
									gridUpdate = false;
									FailureMessage = FormError;
								}
								if (gridUpdate) {
								} else {
									EventCancelled = true;
									GridEditMode(); // Stay in Grid edit mode
								}
							}
						} else if (SameString(Session[Config.SessionInlineMode], "gridedit")) { // Previously in grid edit mode
							if (Query.ContainsKey(Config.TableStartRec) || Query.ContainsKey(Config.TablePageNumber)) // Stay in grid edit mode if paging
								GridEditMode();
							else // Reset grid edit
								ClearInlineMode();
						}
					}

					// Hide list options
					if (IsExport()) {
						ListOptions.HideAllOptions(new List<string> {"sequence"});
						ListOptions.UseDropDownButton = false; // Disable drop down button
						ListOptions.UseButtonGroup = false; // Disable button group
					} else if (IsGridAdd || IsGridEdit) {
						ListOptions.HideAllOptions();
						ListOptions.UseDropDownButton = false; // Disable drop down button
						ListOptions.UseButtonGroup = false; // Disable button group
					}

					// Hide options
					if (IsExport() || !Empty(CurrentAction)) {
						ExportOptions.HideAllOptions();
						FilterOptions.HideAllOptions();
						ImportOptions.HideAllOptions();
					}

					// Hide other options
					if (IsExport()) {
						foreach (var (key, value) in OtherOptions)
							value.HideAllOptions();
					}

					// Show grid delete link for grid add / grid edit
					if (AllowAddDeleteRow) {
						if (IsGridAdd || IsGridEdit) {
							var item = ListOptions["griddelete"];
							if (item != null)
								item.Visible = true;
						}
					}

					// Get default search criteria
					AddFilter(ref DefaultSearchWhere, BasicSearchWhere(true));

					// Get basic search values
					LoadBasicSearchValues();

					// Process filter list
					var filterResult = await ProcessFilterList();
					if (filterResult != null) {

						// Clean output buffer
						if (!Config.Debug)
							Response.Clear();
						return Controller.Json(filterResult);
					}

					// Restore search parms from Session if not searching / reset / export
					if ((IsExport() || Command != "search" && Command != "reset" && Command != "resetall") && Command != "json" && CheckSearchParms())
						RestoreSearchParms();

					// Call Recordset SearchValidated event
					Recordset_SearchValidated();

					// Set up sorting order
					SetupSortOrder();

					// Get basic search criteria
					if (Empty(SearchError))
						srchBasic = BasicSearchWhere();
				}

				// Restore display records
				if (Command != "json" && (RecordsPerPage == -1 || RecordsPerPage > 0)) {
					DisplayRecords = RecordsPerPage; // Restore from Session
				} else {
					DisplayRecords = 20; // Load default
				}

				// Load Sorting Order
				if (Command != "json")
					LoadSortOrder();

				// Load search default if no existing search criteria
				if (!CheckSearchParms()) {

					// Load basic search from default
					BasicSearch.LoadDefault();
					if (!Empty(BasicSearch.Keyword))
						srchBasic = BasicSearchWhere();
				}

				// Build search criteria
				AddFilter(ref SearchWhere, srchBasic);

				// Call Recordset_Searching event
				Recordset_Searching(ref SearchWhere);

				// Save search criteria
				if (Command == "search" && !RestoreSearch) {
					SessionSearchWhere = SearchWhere; // Save to Session // *** rename as SessionSearchWhere property
					StartRecord = 1; // Reset start record counter
					StartRecordNumber = StartRecord;
				} else if (Command != "json") {
					SearchWhere = SessionSearchWhere;
				}

				// Build filter
				filter = "";
				AddFilter(ref filter, DbDetailFilter);
				AddFilter(ref filter, SearchWhere);

				// Set up filter
				if (Command == "json") {
					UseSessionForListSql = false; // Do not use session for ListSql
					CurrentFilter = filter;
				} else {
					SessionWhere = filter;
					CurrentFilter = "";
				}
				if (IsGridAdd) {
					CurrentFilter = "0=1";
					StartRecord = 1;
					DisplayRecords = GridAddRowCount;
					TotalRecords = DisplayRecords;
					StopRecord = DisplayRecords;
				} else {
					TotalRecords = await ListRecordCount();
					StopRecord = DisplayRecords;
					StartRecord = 1;
				if (DisplayRecords <= 0 || (IsExport() && ExportAll)) // Display all records
					DisplayRecords = TotalRecords;
				if (!(IsExport() && ExportAll)) // Set up start record position
					SetupStartRec();
				var selectLimit = UseSelectLimit;
				if (selectLimit)
					Recordset = await LoadRecordset(StartRecord - 1, DisplayRecords);

				// Set no record found message
				if (Empty(CurrentAction) && TotalRecords == 0) {
					if (SearchWhere == "0=101")
						WarningMessage = Language.Phrase("EnterSearchCriteria");
					else
						WarningMessage = Language.Phrase("NoRecord");
				}
				}

				// Search options
				SetupSearchOptions();

				// Normal return
				if (IsApi()) {
					if (!Connection.SelectOffset) // DN
						for (var i = 1; i <= StartRecord - 1; i++) // Move to first record
							await Recordset.ReadAsync();
					using (Recordset) {
						return Controller.Json(new Dictionary<string, object> { {"success", true}, {TableVar, await GetRecordsFromRecordset(Recordset)}, {"totalRecordCount", TotalRecords}, {"version", Config.ProductVersion} });
					}
				}
				return PageResult();
			}

			// Exit inline mode
			protected void ClearInlineMode() {
				LastAction = CurrentAction; // Save last action
				CurrentAction = ""; // Clear action
				Session[Config.SessionInlineMode] = ""; // Clear inline mode
			}

			// Switch to Grid Edit mode
			protected void GridEditMode() {
				CurrentAction = "gridedit";
				Session[Config.SessionInlineMode] = "gridedit"; // Enabled grid edit
				HideFieldsForAddEdit();
			}

			// Perform update to grid
			public async Task<bool> GridUpdate() {
				bool gridUpdate = true;

				// Get old recordset
				CurrentFilter = BuildKeyFilter();
				if (Empty(CurrentFilter))
					CurrentFilter = "0=1";
				string sql = CurrentSql;
				List<Dictionary<string, object>> rsold = await Connection.GetRowsAsync(sql);

				// Call Grid Updating event
				if (!Grid_Updating(rsold)) {
					if (Empty(FailureMessage))
						FailureMessage = Language.Phrase("GridEditCancelled"); // Set grid edit cancelled message
					return false;
				}

				// Begin transaction
				Connection.BeginTrans();
				string key = "";

				// Update row index and get row key
				CurrentForm.Index = -1;
				int rowcnt = CurrentForm.GetInt(FormKeyCountName);
				if (!IsNumeric(rowcnt))
					rowcnt = 0;

				// Update all rows based on key
				try {
					for (int rowindex = 1; rowindex <= rowcnt; rowindex++) {
						CurrentForm.Index = rowindex;
						string rowkey = CurrentForm.GetValue(FormKeyName);
						string rowaction = CurrentForm.GetValue(FormActionName);

						// Load all values and keys
						if (rowaction != "insertdelete") { // Skip insert then deleted rows
							await LoadFormValues(); // Get form values
							if (Empty(rowaction) || rowaction == "edit" || rowaction == "delete") {
								gridUpdate = SetupKeyValues(rowkey); // Set up key values
							} else {
								gridUpdate = true;
							}

							// Skip empty row
							if (rowaction == "insert" && EmptyRow()) {

								// No action required
							// Validate form and insert/update/delete record

							} else if (gridUpdate) {
								if (rowaction == "delete") {
									CurrentFilter = GetRecordFilter();
									gridUpdate = await DeleteRows(); // Delete this row
								} else if (!await ValidateForm()) {
									gridUpdate = false; // Form error, reset action
									FailureMessage = FormError;
								} else {
									if (rowaction == "insert") {
										gridUpdate = await AddRow(); // Insert this row
									} else {
										if (!Empty(rowkey)) {
											SendEmail = false; // Do not send email on update success
											gridUpdate = await EditRow(); // Update this row
										}
									} // End update
								}
							}
							if (gridUpdate) {
								if (!Empty(key))
									key += ", ";
								key += rowkey;
							} else {
								break;
							}
						}
					}
				} catch (Exception e) {
					FailureMessage = e.Message;
					gridUpdate = false;
				}
				if (gridUpdate) {
					Connection.CommitTrans(); // Commit transaction

					// Get new recordset
					List<Dictionary<string, object>> rsnew = await Connection.GetRowsAsync(sql, true); // Use main connection (faster) // DN

					// Call Grid_Updated event
					Grid_Updated(rsold, rsnew);
					if (Empty(SuccessMessage))
						SuccessMessage = Language.Phrase("UpdateSuccess"); // Set up update success message
					ClearInlineMode(); // Clear inline edit mode
				} else {
					Connection.RollbackTrans(); // Rollback transaction
					if (Empty(FailureMessage))
						FailureMessage = Language.Phrase("UpdateFailed"); // Set update failed message
				}
				return gridUpdate;
			}

			// Build filter for all keys
			protected string BuildKeyFilter() {
				string wrkFilter = "";

				// Update row index and get row key
				int rowindex = 1;
				CurrentForm.Index = rowindex;
				string thisKey = CurrentForm.GetValue(FormKeyName);
				while (!Empty(thisKey)) {
					if (SetupKeyValues(thisKey)) {
						string filter = GetRecordFilter();
						if (!Empty(wrkFilter))
							wrkFilter += " OR ";
						wrkFilter += filter;
					} else {
						wrkFilter = "0=1";
						break;
					}

					// Update row index and get row key
					rowindex++; // next row
					CurrentForm.Index = rowindex;
					thisKey = CurrentForm.GetValue(FormKeyName);
				}
				return wrkFilter;
			}

			// Set up key values
			protected bool SetupKeyValues(string key) {
				var arKeyFlds = key.Split(Convert.ToChar(Config.CompositeKeySeparator));
				if (arKeyFlds.Length >= 1) {
					INNCSUMPA.OID.FormValue = arKeyFlds[0];
					if (!IsNumeric(INNCSUMPA.OID.FormValue))
						return false;
				}
				return true;
			}

			// Check if empty row
			public bool EmptyRow() {
				if (CurrentForm.HasValue("x_OID") && CurrentForm.HasValue("o_OID") && !SameString(OID.CurrentValue, OID.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ADNINGRESO") && CurrentForm.HasValue("o_ADNINGRESO") && !SameString(ADNINGRESO.CurrentValue, ADNINGRESO.OldValue))
					return false;
				if (CurrentForm.HasValue("x_SLNORDSER") && CurrentForm.HasValue("o_SLNORDSER") && !SameString(SLNORDSER.CurrentValue, SLNORDSER.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCESTPRO") && CurrentForm.HasValue("o_ISCESTPRO") && !SameString(ISCESTPRO.CurrentValue, ISCESTPRO.OldValue))
					return false;
				if (CurrentForm.HasValue("x_GEENMedico") && CurrentForm.HasValue("o_GEENMedico") && !SameString(GEENMedico.CurrentValue, GEENMedico.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNALMACE") && CurrentForm.HasValue("o_INNALMACE") && !SameString(INNALMACE.CurrentValue, INNALMACE.OldValue))
					return false;
				if (CurrentForm.HasValue("x_GENARESER") && CurrentForm.HasValue("o_GENARESER") && !SameString(GENARESER.CurrentValue, GENARESER.OldValue))
					return false;
				if (CurrentForm.HasValue("x_GENARESER1") && CurrentForm.HasValue("o_GENARESER1") && !SameString(GENARESER1.CurrentValue, GENARESER1.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCSUMIORIGEN") && CurrentForm.HasValue("o_ISCSUMIORIGEN") && !SameString(ISCSUMIORIGEN.CurrentValue, ISCSUMIORIGEN.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCSUMIPENDI") && CurrentForm.HasValue("o_ISCSUMIPENDI") && !SameString(ISCSUMIPENDI.CurrentValue, ISCSUMIPENDI.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNORDDESC") && CurrentForm.HasValue("o_INNORDDESC") && !SameString(INNORDDESC.CurrentValue, INNORDDESC.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCSUMGENPEN") && CurrentForm.HasValue("o_ISCSUMGENPEN") && ConvertToBool(ISCSUMGENPEN.CurrentValue) != ConvertToBool(ISCSUMGENPEN.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCVRBASINC") && CurrentForm.HasValue("o_ISCVRBASINC") && !SameString(ISCVRBASINC.CurrentValue, ISCVRBASINC.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCPORINCRE") && CurrentForm.HasValue("o_ISCPORINCRE") && !SameString(ISCPORINCRE.CurrentValue, ISCPORINCRE.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCPORINCRE1") && CurrentForm.HasValue("o_ISCPORINCRE1") && !SameString(ISCPORINCRE1.CurrentValue, ISCPORINCRE1.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCVALINCRE") && CurrentForm.HasValue("o_ISCVALINCRE") && !SameString(ISCVALINCRE.CurrentValue, ISCVALINCRE.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCVALINCRE1") && CurrentForm.HasValue("o_ISCVALINCRE1") && !SameString(ISCVALINCRE1.CurrentValue, ISCVALINCRE1.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCOIDORIHCRE") && CurrentForm.HasValue("o_ISCOIDORIHCRE") && !SameString(ISCOIDORIHCRE.CurrentValue, ISCOIDORIHCRE.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCTIPSOLDIS") && CurrentForm.HasValue("o_ISCTIPSOLDIS") && !SameString(ISCTIPSOLDIS.CurrentValue, ISCTIPSOLDIS.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNDISFORREC") && CurrentForm.HasValue("o_INNDISFORREC") && !SameString(INNDISFORREC.CurrentValue, INNDISFORREC.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNPENDICAB") && CurrentForm.HasValue("o_INNPENDICAB") && !SameString(INNPENDICAB.CurrentValue, INNPENDICAB.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCINDIDESA") && CurrentForm.HasValue("o_ISCINDIDESA") && ConvertToBool(ISCINDIDESA.CurrentValue) != ConvertToBool(ISCINDIDESA.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCJUSTIFICA") && CurrentForm.HasValue("o_ISCJUSTIFICA") && !SameString(ISCJUSTIFICA.CurrentValue, ISCJUSTIFICA.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCFECORIGEN") && CurrentForm.HasValue("o_ISCFECORIGEN") && !SameString(FormatDateTime(ISCFECORIGEN.CurrentValue, 0), FormatDateTime(ISCFECORIGEN.OldValue, 0)))
					return false;
				if (CurrentForm.HasValue("x_ISCGFMIDFOR") && CurrentForm.HasValue("o_ISCGFMIDFOR") && !SameString(ISCGFMIDFOR.CurrentValue, ISCGFMIDFOR.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNCPLAPRO") && CurrentForm.HasValue("o_INNCPLAPRO") && !SameString(INNCPLAPRO.CurrentValue, INNCPLAPRO.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNCCONFIR") && CurrentForm.HasValue("o_INNCCONFIR") && ConvertToBool(INNCCONFIR.CurrentValue) != ConvertToBool(INNCCONFIR.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNCAUTCONFCOMPEN") && CurrentForm.HasValue("o_INNCAUTCONFCOMPEN") && !SameString(INNCAUTCONFCOMPEN.CurrentValue, INNCAUTCONFCOMPEN.OldValue))
					return false;
				if (CurrentForm.HasValue("x_INNCAUTANULCOMPEN") && CurrentForm.HasValue("o_INNCAUTANULCOMPEN") && !SameString(INNCAUTANULCOMPEN.CurrentValue, INNCAUTANULCOMPEN.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCINTERCOMPEN") && CurrentForm.HasValue("o_ISCINTERCOMPEN") && ConvertToBool(ISCINTERCOMPEN.CurrentValue) != ConvertToBool(ISCINTERCOMPEN.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCMEDREMICOMPEN") && CurrentForm.HasValue("o_ISCMEDREMICOMPEN") && !SameString(ISCMEDREMICOMPEN.CurrentValue, ISCMEDREMICOMPEN.OldValue))
					return false;
				if (CurrentForm.HasValue("x_ISCNUMMESCOMPEN") && CurrentForm.HasValue("o_ISCNUMMESCOMPEN") && !SameString(ISCNUMMESCOMPEN.CurrentValue, ISCNUMMESCOMPEN.OldValue))
					return false;
				return true;
			}

			// Validate grid form
			public async Task<bool> ValidateGridForm() {

				// Get row count
				CurrentForm.Index = -1;
				int rowcnt = CurrentForm.GetInt(FormKeyCountName);

				// Validate all records
				for (int rowindex = 1; rowindex <= rowcnt; rowindex++) {

					// Load current row values
					CurrentForm.Index = rowindex;
					string rowaction = CurrentForm.GetValue(FormActionName);
					if (rowaction != "delete" && rowaction != "insertdelete") {
						await LoadFormValues(); // Get form values
						if (rowaction == "insert" && EmptyRow()) {

							// Ignore
						} else if (!await ValidateForm()) {
							return false;
						}
					}
				}
				return true;
			}

			// Get all form values of the grid
			public List<Dictionary<string, string>> GetGridFormValues() {

				// Get row count
				CurrentForm.Index = -1;
				int rowcnt = CurrentForm.GetInt(FormKeyCountName);
				if (!IsNumeric(rowcnt))
					rowcnt = 0;
				var rows = new List<Dictionary<string, string>>();

				// Loop through all records
				for (int rowindex = 1; rowindex <= rowcnt; rowindex++) {

					// Load current row values
					CurrentForm.Index = rowindex;
					string rowaction = CurrentForm.GetValue(FormActionName);
					if (rowaction != "delete" && rowaction != "insertdelete") {
						LoadFormValues().GetAwaiter().GetResult(); // Load form values (sync)
						if (rowaction == "insert" && EmptyRow()) {

							// Ignore
						} else {
							rows.Add(GetFormValues()); // Return row as array
						}
					}
				}
				return rows; // Return as array of array
			}

			// Restore form values for current row
			public async Task RestoreCurrentRowFormValues(object index) {

				// Get row based on current index
				CurrentForm.Index = ConvertToInt(index);
				await LoadFormValues(); // Load form values
			}

			#pragma warning disable 162, 1998

			// Get list of filters
			public async Task<string> GetFilterList() {
				string filterList = "";

				// Initialize
				var filters = new JObject(); // DN
				filters.Merge(JObject.Parse(OID.AdvancedSearch.ToJson())); // Field OID
				filters.Merge(JObject.Parse(ADNINGRESO.AdvancedSearch.ToJson())); // Field ADNINGRESO
				filters.Merge(JObject.Parse(SLNORDSER.AdvancedSearch.ToJson())); // Field SLNORDSER
				filters.Merge(JObject.Parse(ISCESTPRO.AdvancedSearch.ToJson())); // Field ISCESTPRO
				filters.Merge(JObject.Parse(GEENMedico.AdvancedSearch.ToJson())); // Field GEENMedico
				filters.Merge(JObject.Parse(INNALMACE.AdvancedSearch.ToJson())); // Field INNALMACE
				filters.Merge(JObject.Parse(GENARESER.AdvancedSearch.ToJson())); // Field GENARESER
				filters.Merge(JObject.Parse(ISCDETALL.AdvancedSearch.ToJson())); // Field ISCDETALL
				filters.Merge(JObject.Parse(GENARESER1.AdvancedSearch.ToJson())); // Field GENARESER1
				filters.Merge(JObject.Parse(ISCSUMIORIGEN.AdvancedSearch.ToJson())); // Field ISCSUMIORIGEN
				filters.Merge(JObject.Parse(ISCSUMIPENDI.AdvancedSearch.ToJson())); // Field ISCSUMIPENDI
				filters.Merge(JObject.Parse(INNORDDESC.AdvancedSearch.ToJson())); // Field INNORDDESC
				filters.Merge(JObject.Parse(ISCSUMGENPEN.AdvancedSearch.ToJson())); // Field ISCSUMGENPEN
				filters.Merge(JObject.Parse(ISCVRBASINC.AdvancedSearch.ToJson())); // Field ISCVRBASINC
				filters.Merge(JObject.Parse(ISCPORINCRE.AdvancedSearch.ToJson())); // Field ISCPORINCRE
				filters.Merge(JObject.Parse(ISCPORINCRE1.AdvancedSearch.ToJson())); // Field ISCPORINCRE1
				filters.Merge(JObject.Parse(ISCVALINCRE.AdvancedSearch.ToJson())); // Field ISCVALINCRE
				filters.Merge(JObject.Parse(ISCVALINCRE1.AdvancedSearch.ToJson())); // Field ISCVALINCRE1
				filters.Merge(JObject.Parse(ISCOIDORIHCRE.AdvancedSearch.ToJson())); // Field ISCOIDORIHCRE
				filters.Merge(JObject.Parse(ISCTIPSOLDIS.AdvancedSearch.ToJson())); // Field ISCTIPSOLDIS
				filters.Merge(JObject.Parse(INNDISFORREC.AdvancedSearch.ToJson())); // Field INNDISFORREC
				filters.Merge(JObject.Parse(INNPENDICAB.AdvancedSearch.ToJson())); // Field INNPENDICAB
				filters.Merge(JObject.Parse(ISCINDIDESA.AdvancedSearch.ToJson())); // Field ISCINDIDESA
				filters.Merge(JObject.Parse(ISCJUSTIFICA.AdvancedSearch.ToJson())); // Field ISCJUSTIFICA
				filters.Merge(JObject.Parse(ISCFECORIGEN.AdvancedSearch.ToJson())); // Field ISCFECORIGEN
				filters.Merge(JObject.Parse(ISCGFMIDFOR.AdvancedSearch.ToJson())); // Field ISCGFMIDFOR
				filters.Merge(JObject.Parse(INNCPLAPRO.AdvancedSearch.ToJson())); // Field INNCPLAPRO
				filters.Merge(JObject.Parse(INNCCONFIR.AdvancedSearch.ToJson())); // Field INNCCONFIR
				filters.Merge(JObject.Parse(INNCAUTCONFCOMPEN.AdvancedSearch.ToJson())); // Field INNCAUTCONFCOMPEN
				filters.Merge(JObject.Parse(INNCAUTANULCOMPEN.AdvancedSearch.ToJson())); // Field INNCAUTANULCOMPEN
				filters.Merge(JObject.Parse(ISCINTERCOMPEN.AdvancedSearch.ToJson())); // Field ISCINTERCOMPEN
				filters.Merge(JObject.Parse(ISCMEDREMICOMPEN.AdvancedSearch.ToJson())); // Field ISCMEDREMICOMPEN
				filters.Merge(JObject.Parse(ISCNUMMESCOMPEN.AdvancedSearch.ToJson())); // Field ISCNUMMESCOMPEN
				filters.Merge(JObject.Parse(INNCSUMPA.BasicSearch.ToJson()));

				// Return filter list in JSON
				if (filters.HasValues)
					filterList = "\"data\":" + filters.ToString();
				return (filterList != "") ? "{" + filterList + "}" : "null";
			}

			// Process filter list
			protected async Task<object> ProcessFilterList() {
				if (Post("cmd") == "resetfilter") {
					RestoreFilterList();
				}
				return null;
			}

			#pragma warning restore 162, 1998

			// Restore list of filters
			protected bool RestoreFilterList() {

				// Return if not reset filter
				if (Post("cmd") != "resetfilter")
					return false;
				Dictionary<string, string> filter = JsonConvert.DeserializeObject<Dictionary<string, string>>(Post("filter"));
				Command = "search";
				string sv;

				// Field OID
				if (filter.TryGetValue("x_OID", out sv)) {
					OID.AdvancedSearch.SearchValue = sv;
					OID.AdvancedSearch.SearchOperator = filter["z_OID"];
					OID.AdvancedSearch.SearchCondition = filter["v_OID"];
					OID.AdvancedSearch.SearchValue2 = filter["y_OID"];
					OID.AdvancedSearch.SearchOperator2 = filter["w_OID"];
					OID.AdvancedSearch.Save();
				}

				// Field ADNINGRESO
				if (filter.TryGetValue("x_ADNINGRESO", out sv)) {
					ADNINGRESO.AdvancedSearch.SearchValue = sv;
					ADNINGRESO.AdvancedSearch.SearchOperator = filter["z_ADNINGRESO"];
					ADNINGRESO.AdvancedSearch.SearchCondition = filter["v_ADNINGRESO"];
					ADNINGRESO.AdvancedSearch.SearchValue2 = filter["y_ADNINGRESO"];
					ADNINGRESO.AdvancedSearch.SearchOperator2 = filter["w_ADNINGRESO"];
					ADNINGRESO.AdvancedSearch.Save();
				}

				// Field SLNORDSER
				if (filter.TryGetValue("x_SLNORDSER", out sv)) {
					SLNORDSER.AdvancedSearch.SearchValue = sv;
					SLNORDSER.AdvancedSearch.SearchOperator = filter["z_SLNORDSER"];
					SLNORDSER.AdvancedSearch.SearchCondition = filter["v_SLNORDSER"];
					SLNORDSER.AdvancedSearch.SearchValue2 = filter["y_SLNORDSER"];
					SLNORDSER.AdvancedSearch.SearchOperator2 = filter["w_SLNORDSER"];
					SLNORDSER.AdvancedSearch.Save();
				}

				// Field ISCESTPRO
				if (filter.TryGetValue("x_ISCESTPRO", out sv)) {
					ISCESTPRO.AdvancedSearch.SearchValue = sv;
					ISCESTPRO.AdvancedSearch.SearchOperator = filter["z_ISCESTPRO"];
					ISCESTPRO.AdvancedSearch.SearchCondition = filter["v_ISCESTPRO"];
					ISCESTPRO.AdvancedSearch.SearchValue2 = filter["y_ISCESTPRO"];
					ISCESTPRO.AdvancedSearch.SearchOperator2 = filter["w_ISCESTPRO"];
					ISCESTPRO.AdvancedSearch.Save();
				}

				// Field GEENMedico
				if (filter.TryGetValue("x_GEENMedico", out sv)) {
					GEENMedico.AdvancedSearch.SearchValue = sv;
					GEENMedico.AdvancedSearch.SearchOperator = filter["z_GEENMedico"];
					GEENMedico.AdvancedSearch.SearchCondition = filter["v_GEENMedico"];
					GEENMedico.AdvancedSearch.SearchValue2 = filter["y_GEENMedico"];
					GEENMedico.AdvancedSearch.SearchOperator2 = filter["w_GEENMedico"];
					GEENMedico.AdvancedSearch.Save();
				}

				// Field INNALMACE
				if (filter.TryGetValue("x_INNALMACE", out sv)) {
					INNALMACE.AdvancedSearch.SearchValue = sv;
					INNALMACE.AdvancedSearch.SearchOperator = filter["z_INNALMACE"];
					INNALMACE.AdvancedSearch.SearchCondition = filter["v_INNALMACE"];
					INNALMACE.AdvancedSearch.SearchValue2 = filter["y_INNALMACE"];
					INNALMACE.AdvancedSearch.SearchOperator2 = filter["w_INNALMACE"];
					INNALMACE.AdvancedSearch.Save();
				}

				// Field GENARESER
				if (filter.TryGetValue("x_GENARESER", out sv)) {
					GENARESER.AdvancedSearch.SearchValue = sv;
					GENARESER.AdvancedSearch.SearchOperator = filter["z_GENARESER"];
					GENARESER.AdvancedSearch.SearchCondition = filter["v_GENARESER"];
					GENARESER.AdvancedSearch.SearchValue2 = filter["y_GENARESER"];
					GENARESER.AdvancedSearch.SearchOperator2 = filter["w_GENARESER"];
					GENARESER.AdvancedSearch.Save();
				}

				// Field ISCDETALL
				if (filter.TryGetValue("x_ISCDETALL", out sv)) {
					ISCDETALL.AdvancedSearch.SearchValue = sv;
					ISCDETALL.AdvancedSearch.SearchOperator = filter["z_ISCDETALL"];
					ISCDETALL.AdvancedSearch.SearchCondition = filter["v_ISCDETALL"];
					ISCDETALL.AdvancedSearch.SearchValue2 = filter["y_ISCDETALL"];
					ISCDETALL.AdvancedSearch.SearchOperator2 = filter["w_ISCDETALL"];
					ISCDETALL.AdvancedSearch.Save();
				}

				// Field GENARESER1
				if (filter.TryGetValue("x_GENARESER1", out sv)) {
					GENARESER1.AdvancedSearch.SearchValue = sv;
					GENARESER1.AdvancedSearch.SearchOperator = filter["z_GENARESER1"];
					GENARESER1.AdvancedSearch.SearchCondition = filter["v_GENARESER1"];
					GENARESER1.AdvancedSearch.SearchValue2 = filter["y_GENARESER1"];
					GENARESER1.AdvancedSearch.SearchOperator2 = filter["w_GENARESER1"];
					GENARESER1.AdvancedSearch.Save();
				}

				// Field ISCSUMIORIGEN
				if (filter.TryGetValue("x_ISCSUMIORIGEN", out sv)) {
					ISCSUMIORIGEN.AdvancedSearch.SearchValue = sv;
					ISCSUMIORIGEN.AdvancedSearch.SearchOperator = filter["z_ISCSUMIORIGEN"];
					ISCSUMIORIGEN.AdvancedSearch.SearchCondition = filter["v_ISCSUMIORIGEN"];
					ISCSUMIORIGEN.AdvancedSearch.SearchValue2 = filter["y_ISCSUMIORIGEN"];
					ISCSUMIORIGEN.AdvancedSearch.SearchOperator2 = filter["w_ISCSUMIORIGEN"];
					ISCSUMIORIGEN.AdvancedSearch.Save();
				}

				// Field ISCSUMIPENDI
				if (filter.TryGetValue("x_ISCSUMIPENDI", out sv)) {
					ISCSUMIPENDI.AdvancedSearch.SearchValue = sv;
					ISCSUMIPENDI.AdvancedSearch.SearchOperator = filter["z_ISCSUMIPENDI"];
					ISCSUMIPENDI.AdvancedSearch.SearchCondition = filter["v_ISCSUMIPENDI"];
					ISCSUMIPENDI.AdvancedSearch.SearchValue2 = filter["y_ISCSUMIPENDI"];
					ISCSUMIPENDI.AdvancedSearch.SearchOperator2 = filter["w_ISCSUMIPENDI"];
					ISCSUMIPENDI.AdvancedSearch.Save();
				}

				// Field INNORDDESC
				if (filter.TryGetValue("x_INNORDDESC", out sv)) {
					INNORDDESC.AdvancedSearch.SearchValue = sv;
					INNORDDESC.AdvancedSearch.SearchOperator = filter["z_INNORDDESC"];
					INNORDDESC.AdvancedSearch.SearchCondition = filter["v_INNORDDESC"];
					INNORDDESC.AdvancedSearch.SearchValue2 = filter["y_INNORDDESC"];
					INNORDDESC.AdvancedSearch.SearchOperator2 = filter["w_INNORDDESC"];
					INNORDDESC.AdvancedSearch.Save();
				}

				// Field ISCSUMGENPEN
				if (filter.TryGetValue("x_ISCSUMGENPEN", out sv)) {
					ISCSUMGENPEN.AdvancedSearch.SearchValue = sv;
					ISCSUMGENPEN.AdvancedSearch.SearchOperator = filter["z_ISCSUMGENPEN"];
					ISCSUMGENPEN.AdvancedSearch.SearchCondition = filter["v_ISCSUMGENPEN"];
					ISCSUMGENPEN.AdvancedSearch.SearchValue2 = filter["y_ISCSUMGENPEN"];
					ISCSUMGENPEN.AdvancedSearch.SearchOperator2 = filter["w_ISCSUMGENPEN"];
					ISCSUMGENPEN.AdvancedSearch.Save();
				}

				// Field ISCVRBASINC
				if (filter.TryGetValue("x_ISCVRBASINC", out sv)) {
					ISCVRBASINC.AdvancedSearch.SearchValue = sv;
					ISCVRBASINC.AdvancedSearch.SearchOperator = filter["z_ISCVRBASINC"];
					ISCVRBASINC.AdvancedSearch.SearchCondition = filter["v_ISCVRBASINC"];
					ISCVRBASINC.AdvancedSearch.SearchValue2 = filter["y_ISCVRBASINC"];
					ISCVRBASINC.AdvancedSearch.SearchOperator2 = filter["w_ISCVRBASINC"];
					ISCVRBASINC.AdvancedSearch.Save();
				}

				// Field ISCPORINCRE
				if (filter.TryGetValue("x_ISCPORINCRE", out sv)) {
					ISCPORINCRE.AdvancedSearch.SearchValue = sv;
					ISCPORINCRE.AdvancedSearch.SearchOperator = filter["z_ISCPORINCRE"];
					ISCPORINCRE.AdvancedSearch.SearchCondition = filter["v_ISCPORINCRE"];
					ISCPORINCRE.AdvancedSearch.SearchValue2 = filter["y_ISCPORINCRE"];
					ISCPORINCRE.AdvancedSearch.SearchOperator2 = filter["w_ISCPORINCRE"];
					ISCPORINCRE.AdvancedSearch.Save();
				}

				// Field ISCPORINCRE1
				if (filter.TryGetValue("x_ISCPORINCRE1", out sv)) {
					ISCPORINCRE1.AdvancedSearch.SearchValue = sv;
					ISCPORINCRE1.AdvancedSearch.SearchOperator = filter["z_ISCPORINCRE1"];
					ISCPORINCRE1.AdvancedSearch.SearchCondition = filter["v_ISCPORINCRE1"];
					ISCPORINCRE1.AdvancedSearch.SearchValue2 = filter["y_ISCPORINCRE1"];
					ISCPORINCRE1.AdvancedSearch.SearchOperator2 = filter["w_ISCPORINCRE1"];
					ISCPORINCRE1.AdvancedSearch.Save();
				}

				// Field ISCVALINCRE
				if (filter.TryGetValue("x_ISCVALINCRE", out sv)) {
					ISCVALINCRE.AdvancedSearch.SearchValue = sv;
					ISCVALINCRE.AdvancedSearch.SearchOperator = filter["z_ISCVALINCRE"];
					ISCVALINCRE.AdvancedSearch.SearchCondition = filter["v_ISCVALINCRE"];
					ISCVALINCRE.AdvancedSearch.SearchValue2 = filter["y_ISCVALINCRE"];
					ISCVALINCRE.AdvancedSearch.SearchOperator2 = filter["w_ISCVALINCRE"];
					ISCVALINCRE.AdvancedSearch.Save();
				}

				// Field ISCVALINCRE1
				if (filter.TryGetValue("x_ISCVALINCRE1", out sv)) {
					ISCVALINCRE1.AdvancedSearch.SearchValue = sv;
					ISCVALINCRE1.AdvancedSearch.SearchOperator = filter["z_ISCVALINCRE1"];
					ISCVALINCRE1.AdvancedSearch.SearchCondition = filter["v_ISCVALINCRE1"];
					ISCVALINCRE1.AdvancedSearch.SearchValue2 = filter["y_ISCVALINCRE1"];
					ISCVALINCRE1.AdvancedSearch.SearchOperator2 = filter["w_ISCVALINCRE1"];
					ISCVALINCRE1.AdvancedSearch.Save();
				}

				// Field ISCOIDORIHCRE
				if (filter.TryGetValue("x_ISCOIDORIHCRE", out sv)) {
					ISCOIDORIHCRE.AdvancedSearch.SearchValue = sv;
					ISCOIDORIHCRE.AdvancedSearch.SearchOperator = filter["z_ISCOIDORIHCRE"];
					ISCOIDORIHCRE.AdvancedSearch.SearchCondition = filter["v_ISCOIDORIHCRE"];
					ISCOIDORIHCRE.AdvancedSearch.SearchValue2 = filter["y_ISCOIDORIHCRE"];
					ISCOIDORIHCRE.AdvancedSearch.SearchOperator2 = filter["w_ISCOIDORIHCRE"];
					ISCOIDORIHCRE.AdvancedSearch.Save();
				}

				// Field ISCTIPSOLDIS
				if (filter.TryGetValue("x_ISCTIPSOLDIS", out sv)) {
					ISCTIPSOLDIS.AdvancedSearch.SearchValue = sv;
					ISCTIPSOLDIS.AdvancedSearch.SearchOperator = filter["z_ISCTIPSOLDIS"];
					ISCTIPSOLDIS.AdvancedSearch.SearchCondition = filter["v_ISCTIPSOLDIS"];
					ISCTIPSOLDIS.AdvancedSearch.SearchValue2 = filter["y_ISCTIPSOLDIS"];
					ISCTIPSOLDIS.AdvancedSearch.SearchOperator2 = filter["w_ISCTIPSOLDIS"];
					ISCTIPSOLDIS.AdvancedSearch.Save();
				}

				// Field INNDISFORREC
				if (filter.TryGetValue("x_INNDISFORREC", out sv)) {
					INNDISFORREC.AdvancedSearch.SearchValue = sv;
					INNDISFORREC.AdvancedSearch.SearchOperator = filter["z_INNDISFORREC"];
					INNDISFORREC.AdvancedSearch.SearchCondition = filter["v_INNDISFORREC"];
					INNDISFORREC.AdvancedSearch.SearchValue2 = filter["y_INNDISFORREC"];
					INNDISFORREC.AdvancedSearch.SearchOperator2 = filter["w_INNDISFORREC"];
					INNDISFORREC.AdvancedSearch.Save();
				}

				// Field INNPENDICAB
				if (filter.TryGetValue("x_INNPENDICAB", out sv)) {
					INNPENDICAB.AdvancedSearch.SearchValue = sv;
					INNPENDICAB.AdvancedSearch.SearchOperator = filter["z_INNPENDICAB"];
					INNPENDICAB.AdvancedSearch.SearchCondition = filter["v_INNPENDICAB"];
					INNPENDICAB.AdvancedSearch.SearchValue2 = filter["y_INNPENDICAB"];
					INNPENDICAB.AdvancedSearch.SearchOperator2 = filter["w_INNPENDICAB"];
					INNPENDICAB.AdvancedSearch.Save();
				}

				// Field ISCINDIDESA
				if (filter.TryGetValue("x_ISCINDIDESA", out sv)) {
					ISCINDIDESA.AdvancedSearch.SearchValue = sv;
					ISCINDIDESA.AdvancedSearch.SearchOperator = filter["z_ISCINDIDESA"];
					ISCINDIDESA.AdvancedSearch.SearchCondition = filter["v_ISCINDIDESA"];
					ISCINDIDESA.AdvancedSearch.SearchValue2 = filter["y_ISCINDIDESA"];
					ISCINDIDESA.AdvancedSearch.SearchOperator2 = filter["w_ISCINDIDESA"];
					ISCINDIDESA.AdvancedSearch.Save();
				}

				// Field ISCJUSTIFICA
				if (filter.TryGetValue("x_ISCJUSTIFICA", out sv)) {
					ISCJUSTIFICA.AdvancedSearch.SearchValue = sv;
					ISCJUSTIFICA.AdvancedSearch.SearchOperator = filter["z_ISCJUSTIFICA"];
					ISCJUSTIFICA.AdvancedSearch.SearchCondition = filter["v_ISCJUSTIFICA"];
					ISCJUSTIFICA.AdvancedSearch.SearchValue2 = filter["y_ISCJUSTIFICA"];
					ISCJUSTIFICA.AdvancedSearch.SearchOperator2 = filter["w_ISCJUSTIFICA"];
					ISCJUSTIFICA.AdvancedSearch.Save();
				}

				// Field ISCFECORIGEN
				if (filter.TryGetValue("x_ISCFECORIGEN", out sv)) {
					ISCFECORIGEN.AdvancedSearch.SearchValue = sv;
					ISCFECORIGEN.AdvancedSearch.SearchOperator = filter["z_ISCFECORIGEN"];
					ISCFECORIGEN.AdvancedSearch.SearchCondition = filter["v_ISCFECORIGEN"];
					ISCFECORIGEN.AdvancedSearch.SearchValue2 = filter["y_ISCFECORIGEN"];
					ISCFECORIGEN.AdvancedSearch.SearchOperator2 = filter["w_ISCFECORIGEN"];
					ISCFECORIGEN.AdvancedSearch.Save();
				}

				// Field ISCGFMIDFOR
				if (filter.TryGetValue("x_ISCGFMIDFOR", out sv)) {
					ISCGFMIDFOR.AdvancedSearch.SearchValue = sv;
					ISCGFMIDFOR.AdvancedSearch.SearchOperator = filter["z_ISCGFMIDFOR"];
					ISCGFMIDFOR.AdvancedSearch.SearchCondition = filter["v_ISCGFMIDFOR"];
					ISCGFMIDFOR.AdvancedSearch.SearchValue2 = filter["y_ISCGFMIDFOR"];
					ISCGFMIDFOR.AdvancedSearch.SearchOperator2 = filter["w_ISCGFMIDFOR"];
					ISCGFMIDFOR.AdvancedSearch.Save();
				}

				// Field INNCPLAPRO
				if (filter.TryGetValue("x_INNCPLAPRO", out sv)) {
					INNCPLAPRO.AdvancedSearch.SearchValue = sv;
					INNCPLAPRO.AdvancedSearch.SearchOperator = filter["z_INNCPLAPRO"];
					INNCPLAPRO.AdvancedSearch.SearchCondition = filter["v_INNCPLAPRO"];
					INNCPLAPRO.AdvancedSearch.SearchValue2 = filter["y_INNCPLAPRO"];
					INNCPLAPRO.AdvancedSearch.SearchOperator2 = filter["w_INNCPLAPRO"];
					INNCPLAPRO.AdvancedSearch.Save();
				}

				// Field INNCCONFIR
				if (filter.TryGetValue("x_INNCCONFIR", out sv)) {
					INNCCONFIR.AdvancedSearch.SearchValue = sv;
					INNCCONFIR.AdvancedSearch.SearchOperator = filter["z_INNCCONFIR"];
					INNCCONFIR.AdvancedSearch.SearchCondition = filter["v_INNCCONFIR"];
					INNCCONFIR.AdvancedSearch.SearchValue2 = filter["y_INNCCONFIR"];
					INNCCONFIR.AdvancedSearch.SearchOperator2 = filter["w_INNCCONFIR"];
					INNCCONFIR.AdvancedSearch.Save();
				}

				// Field INNCAUTCONFCOMPEN
				if (filter.TryGetValue("x_INNCAUTCONFCOMPEN", out sv)) {
					INNCAUTCONFCOMPEN.AdvancedSearch.SearchValue = sv;
					INNCAUTCONFCOMPEN.AdvancedSearch.SearchOperator = filter["z_INNCAUTCONFCOMPEN"];
					INNCAUTCONFCOMPEN.AdvancedSearch.SearchCondition = filter["v_INNCAUTCONFCOMPEN"];
					INNCAUTCONFCOMPEN.AdvancedSearch.SearchValue2 = filter["y_INNCAUTCONFCOMPEN"];
					INNCAUTCONFCOMPEN.AdvancedSearch.SearchOperator2 = filter["w_INNCAUTCONFCOMPEN"];
					INNCAUTCONFCOMPEN.AdvancedSearch.Save();
				}

				// Field INNCAUTANULCOMPEN
				if (filter.TryGetValue("x_INNCAUTANULCOMPEN", out sv)) {
					INNCAUTANULCOMPEN.AdvancedSearch.SearchValue = sv;
					INNCAUTANULCOMPEN.AdvancedSearch.SearchOperator = filter["z_INNCAUTANULCOMPEN"];
					INNCAUTANULCOMPEN.AdvancedSearch.SearchCondition = filter["v_INNCAUTANULCOMPEN"];
					INNCAUTANULCOMPEN.AdvancedSearch.SearchValue2 = filter["y_INNCAUTANULCOMPEN"];
					INNCAUTANULCOMPEN.AdvancedSearch.SearchOperator2 = filter["w_INNCAUTANULCOMPEN"];
					INNCAUTANULCOMPEN.AdvancedSearch.Save();
				}

				// Field ISCINTERCOMPEN
				if (filter.TryGetValue("x_ISCINTERCOMPEN", out sv)) {
					ISCINTERCOMPEN.AdvancedSearch.SearchValue = sv;
					ISCINTERCOMPEN.AdvancedSearch.SearchOperator = filter["z_ISCINTERCOMPEN"];
					ISCINTERCOMPEN.AdvancedSearch.SearchCondition = filter["v_ISCINTERCOMPEN"];
					ISCINTERCOMPEN.AdvancedSearch.SearchValue2 = filter["y_ISCINTERCOMPEN"];
					ISCINTERCOMPEN.AdvancedSearch.SearchOperator2 = filter["w_ISCINTERCOMPEN"];
					ISCINTERCOMPEN.AdvancedSearch.Save();
				}

				// Field ISCMEDREMICOMPEN
				if (filter.TryGetValue("x_ISCMEDREMICOMPEN", out sv)) {
					ISCMEDREMICOMPEN.AdvancedSearch.SearchValue = sv;
					ISCMEDREMICOMPEN.AdvancedSearch.SearchOperator = filter["z_ISCMEDREMICOMPEN"];
					ISCMEDREMICOMPEN.AdvancedSearch.SearchCondition = filter["v_ISCMEDREMICOMPEN"];
					ISCMEDREMICOMPEN.AdvancedSearch.SearchValue2 = filter["y_ISCMEDREMICOMPEN"];
					ISCMEDREMICOMPEN.AdvancedSearch.SearchOperator2 = filter["w_ISCMEDREMICOMPEN"];
					ISCMEDREMICOMPEN.AdvancedSearch.Save();
				}

				// Field ISCNUMMESCOMPEN
				if (filter.TryGetValue("x_ISCNUMMESCOMPEN", out sv)) {
					ISCNUMMESCOMPEN.AdvancedSearch.SearchValue = sv;
					ISCNUMMESCOMPEN.AdvancedSearch.SearchOperator = filter["z_ISCNUMMESCOMPEN"];
					ISCNUMMESCOMPEN.AdvancedSearch.SearchCondition = filter["v_ISCNUMMESCOMPEN"];
					ISCNUMMESCOMPEN.AdvancedSearch.SearchValue2 = filter["y_ISCNUMMESCOMPEN"];
					ISCNUMMESCOMPEN.AdvancedSearch.SearchOperator2 = filter["w_ISCNUMMESCOMPEN"];
					ISCNUMMESCOMPEN.AdvancedSearch.Save();
				}
				if (filter.TryGetValue(Config.TableBasicSearch, out string keyword))
					BasicSearch.SessionKeyword = keyword;
				if (filter.TryGetValue(Config.TableBasicSearchType, out string type))
					BasicSearch.SessionType = type;
				return true;
			}

			// Return basic search SQL
			protected string BasicSearchSql(List<string> keywords, string type) {
				string where = "";
				BuildBasicSearchSql(ref where, ISCDETALL, keywords, type);
				BuildBasicSearchSql(ref where, ISCJUSTIFICA, keywords, type);
				BuildBasicSearchSql(ref where, ISCGFMIDFOR, keywords, type);
				BuildBasicSearchSql(ref where, INNCAUTCONFCOMPEN, keywords, type);
				BuildBasicSearchSql(ref where, INNCAUTANULCOMPEN, keywords, type);
				BuildBasicSearchSql(ref where, ISCMEDREMICOMPEN, keywords, type);
				return where;
			}

			// Build basic search SQL
			protected void BuildBasicSearchSql(ref string where, DbField fld, List<string> keywords, string type) {
				string defCond = (type == "OR") ? "OR" : "AND";
				var sqls = new List<string>(); // List for SQL parts
				var conds = new List<string>(); // List for search conditions
				int cnt = keywords.Count;
				int j = 0; // Number of SQL parts
				for (int i = 0; i < cnt; i++) {
					string keyword = keywords[i];
					keyword = keyword.Trim();
					string[] ar;
					if (!Empty(Config.BasicSearchIgnorePattern)) {
						keyword = Regex.Replace(keyword, Config.BasicSearchIgnorePattern, "\\");
						ar = keyword.Split('\\');
					} else {
						ar = new string[] { keyword };
					}
					foreach (var kw in ar) {
						if (!Empty(kw)) {
							string wrk = "";
							if (kw == "OR" && type == "") {
								if (j > 0)
									conds[j - 1] = "OR";
							} else if (kw == Config.NullValue) {
								wrk = fld.Expression + " IS NULL";
							} else if (kw == Config.NotNullValue) {
								wrk = fld.Expression + " IS NOT NULL";
							} else if (fld.IsVirtual) {
								wrk = fld.VirtualExpression + Like(QuotedValue("%" + kw + "%", Config.DataTypeString, DbId), DbId);
							} else if (fld.DataType != Config.DataTypeNumber || IsNumeric(kw)) {
								wrk = fld.BasicSearchExpression + Like(QuotedValue("%" + kw + "%", Config.DataTypeString, DbId), DbId);
							}
							if (!Empty(wrk)) {
								sqls.Add(wrk); // DN
								conds.Add(defCond); // DN
								j++;
							}
						}
					}
				}
				cnt = sqls.Count;
				bool quoted = false;
				string sql = "";
				if (cnt > 0) {
					for (int i = 0; i < cnt - 1; i++) {
						if (conds[i] == "OR") {
							if (!quoted)
								sql += "(";
							quoted = true;
						}
						sql += sqls[i];
						if (quoted && conds[i] != "OR") {
							sql += ")";
							quoted = false;
						}
						sql += " " + conds[i] + " ";
					}
					sql += sqls[cnt - 1];
					if (quoted)
						sql += ")";
				}
				if (!Empty(sql)) {
					if (!Empty(where))
						where += " OR ";
					where += "(" + sql + ")";
				}
			}

			// Return basic search WHERE clause based on search keyword and type
			protected string BasicSearchWhere(bool def = false) {
				string searchStr = "";
				string searchKeyword = def ? BasicSearch.KeywordDefault : BasicSearch.Keyword;
				string searchType = def ? BasicSearch.TypeDefault : BasicSearch.Type;

				// Get search SQL
				if (!Empty(searchKeyword)) {
					var ar = BasicSearch.KeywordList(def);
					if ((searchType == "OR" || searchType == "AND") && ConvertToBool(BasicSearch.BasicSearchAnyFields)) {
						foreach (var keyword in ar) {
							if (keyword != "") {
								if (searchStr != "")
									searchStr += " " + searchType + " ";
								searchStr += "(" + BasicSearchSql(new List<string> { keyword }, searchType) + ")";
							}
						}
					} else {
						searchStr = BasicSearchSql(ar, searchType);
					}
					if (!def && (new List<string> {"", "reset", "resetall"}).Contains(Command))
						Command = "search";
				}
				if (!def && Command == "search") {
					BasicSearch.SessionKeyword = searchKeyword;
					BasicSearch.SessionType = searchType;
				}
				return searchStr;
			}

			// Check if search parm exists
			protected bool CheckSearchParms() {

				// Check basic search
				if (BasicSearch.IssetSession)
					return true;
				return false;
			}

			// Clear all search parameters
			protected void ResetSearchParms() {
				SearchWhere = "";
				SessionSearchWhere = SearchWhere;

				// Clear basic search parameters
				ResetBasicSearchParms();
			}

			// Load advanced search default values
			protected bool LoadAdvancedSearchDefault() {
				return false;
			}

			// Clear all basic search parameters
			protected void ResetBasicSearchParms() {
				BasicSearch.UnsetSession();
			}

			// Restore all search parameters
			protected void RestoreSearchParms() {
				RestoreSearch = true;

				// Restore basic search values
				BasicSearch.Load();
			}

			// Set up sort parameters
			protected void SetupSortOrder() {

				// Check for "order" parameter
				if (!Empty(Get("order"))) {
					CurrentOrder = Get("order");
					CurrentOrderType = Get("ordertype");
					UpdateSort(OID); // OID
					UpdateSort(ADNINGRESO); // ADNINGRESO
					UpdateSort(SLNORDSER); // SLNORDSER
					UpdateSort(ISCESTPRO); // ISCESTPRO
					UpdateSort(GEENMedico); // GEENMedico
					UpdateSort(INNALMACE); // INNALMACE
					UpdateSort(GENARESER); // GENARESER
					UpdateSort(GENARESER1); // GENARESER1
					UpdateSort(ISCSUMIORIGEN); // ISCSUMIORIGEN
					UpdateSort(ISCSUMIPENDI); // ISCSUMIPENDI
					UpdateSort(INNORDDESC); // INNORDDESC
					UpdateSort(ISCSUMGENPEN); // ISCSUMGENPEN
					UpdateSort(ISCVRBASINC); // ISCVRBASINC
					UpdateSort(ISCPORINCRE); // ISCPORINCRE
					UpdateSort(ISCPORINCRE1); // ISCPORINCRE1
					UpdateSort(ISCVALINCRE); // ISCVALINCRE
					UpdateSort(ISCVALINCRE1); // ISCVALINCRE1
					UpdateSort(ISCOIDORIHCRE); // ISCOIDORIHCRE
					UpdateSort(ISCTIPSOLDIS); // ISCTIPSOLDIS
					UpdateSort(INNDISFORREC); // INNDISFORREC
					UpdateSort(INNPENDICAB); // INNPENDICAB
					UpdateSort(ISCINDIDESA); // ISCINDIDESA
					UpdateSort(ISCJUSTIFICA); // ISCJUSTIFICA
					UpdateSort(ISCFECORIGEN); // ISCFECORIGEN
					UpdateSort(ISCGFMIDFOR); // ISCGFMIDFOR
					UpdateSort(INNCPLAPRO); // INNCPLAPRO
					UpdateSort(INNCCONFIR); // INNCCONFIR
					UpdateSort(INNCAUTCONFCOMPEN); // INNCAUTCONFCOMPEN
					UpdateSort(INNCAUTANULCOMPEN); // INNCAUTANULCOMPEN
					UpdateSort(ISCINTERCOMPEN); // ISCINTERCOMPEN
					UpdateSort(ISCMEDREMICOMPEN); // ISCMEDREMICOMPEN
					UpdateSort(ISCNUMMESCOMPEN); // ISCNUMMESCOMPEN
					StartRecordNumber = 1; // Reset start position
				}
			}

			// Load sort order parameters
			protected void LoadSortOrder() {
				string orderBy = SessionOrderBy; // Get Order By from Session
				if (Empty(orderBy)) {
					if (!Empty(SqlOrderBy)) {
						orderBy = SqlOrderBy;
						SessionOrderBy = orderBy;
					}
				}
			}

			// Reset command
			// cmd=reset (Reset search parameters)
			// cmd=resetall (Reset search and master/detail parameters)
			// cmd=resetsort (Reset sort parameters)

			protected void ResetCommand() {

				// Get reset cmd
				if (Command.ToLower().StartsWith("reset")) {

					// Reset search criteria
					if (SameText(Command, "reset") || SameText(Command, "resetall"))
						ResetSearchParms();

					// Reset sorting order
					if (SameText(Command, "resetsort")) {
						string orderBy = "";
						SessionOrderBy = orderBy;
						OID.Sort = "";
						ADNINGRESO.Sort = "";
						SLNORDSER.Sort = "";
						ISCESTPRO.Sort = "";
						GEENMedico.Sort = "";
						INNALMACE.Sort = "";
						GENARESER.Sort = "";
						GENARESER1.Sort = "";
						ISCSUMIORIGEN.Sort = "";
						ISCSUMIPENDI.Sort = "";
						INNORDDESC.Sort = "";
						ISCSUMGENPEN.Sort = "";
						ISCVRBASINC.Sort = "";
						ISCPORINCRE.Sort = "";
						ISCPORINCRE1.Sort = "";
						ISCVALINCRE.Sort = "";
						ISCVALINCRE1.Sort = "";
						ISCOIDORIHCRE.Sort = "";
						ISCTIPSOLDIS.Sort = "";
						INNDISFORREC.Sort = "";
						INNPENDICAB.Sort = "";
						ISCINDIDESA.Sort = "";
						ISCJUSTIFICA.Sort = "";
						ISCFECORIGEN.Sort = "";
						ISCGFMIDFOR.Sort = "";
						INNCPLAPRO.Sort = "";
						INNCCONFIR.Sort = "";
						INNCAUTCONFCOMPEN.Sort = "";
						INNCAUTANULCOMPEN.Sort = "";
						ISCINTERCOMPEN.Sort = "";
						ISCMEDREMICOMPEN.Sort = "";
						ISCNUMMESCOMPEN.Sort = "";
					}

					// Reset start position
					StartRecord = 1;
					StartRecordNumber = StartRecord;
				}
			}

			#pragma warning disable 1998

			// Set up list options
			protected async Task SetupListOptions() {
				ListOption item;

				// "griddelete"
				if (AllowAddDeleteRow) {
					item = ListOptions.Add("griddelete");
					item.CssClass = "text-nowrap";
					item.OnLeft = false;
					item.Visible = false; // Default hidden
				}

				// Add group option item
				item = ListOptions.Add(ListOptions.GroupOptionName);
				item.Body = "";
				item.OnLeft = false;
				item.Visible = false;

				// "view"
				item = ListOptions.Add("view");
				item.CssClass = "text-nowrap";
				item.Visible = true;
				item.OnLeft = false;

				// "edit"
				item = ListOptions.Add("edit");
				item.CssClass = "text-nowrap";
				item.Visible = true;
				item.OnLeft = false;

				// "copy"
				item = ListOptions.Add("copy");
				item.CssClass = "text-nowrap";
				item.Visible = true;
				item.OnLeft = false;

				// "delete"
				item = ListOptions.Add("delete");
				item.CssClass = "text-nowrap";
				item.Visible = true;
				item.OnLeft = false;

				// List actions
				item = ListOptions.Add("listactions");
				item.CssClass = "text-nowrap";
				item.OnLeft = false;
				item.Visible = false;
				item.ShowInButtonGroup = false;
				item.ShowInDropDown = false;

				// "checkbox"
				item = ListOptions.Add("checkbox");
				item.CssStyle = "white-space: nowrap; text-align: center; vertical-align: middle; margin: 0px;";
				item.Visible = false;
				item.OnLeft = false;
				item.Header = "<input type=\"checkbox\" name=\"key\" id=\"key\" onclick=\"ew.selectAllKey(this);\">";
				item.ShowInDropDown = false;
				item.ShowInButtonGroup = false;

				// Drop down button for ListOptions
				ListOptions.UseDropDownButton = false;
				ListOptions.DropDownButtonPhrase = Language.Phrase("ButtonListOptions");
				ListOptions.UseButtonGroup = false;
				if (ListOptions.UseButtonGroup && IsMobile())
					ListOptions.UseDropDownButton = true;
				ListOptions.ButtonClass = ""; // Class for button group

				// Call ListOptions_Load event
				ListOptions_Load();
				SetupListOptionsExt();
				item = ListOptions[ListOptions.GroupOptionName];
				item.Visible = ListOptions.GroupOptionVisible;
			}

			#pragma warning restore 1998

			// Render list options

			#pragma warning disable 168, 219, 1998

			public async Task RenderListOptions() {
				ListOption listOption;
				var isVisible = false; // DN
				ListOptions.LoadDefault();

				// Call ListOptions_Rendering event
				ListOptions_Rendering();
				string keyName = "";

				// Set up row action and key
				if (IsNumeric(RowIndex) && CurrentMode != "view") {
					CurrentForm.Index = ConvertToInt(RowIndex);
					var actionName = FormActionName.Replace("k_", "k" + Convert.ToString(RowIndex) + "_");
					var oldKeyName = FormOldKeyName.Replace("k_", "k" + Convert.ToString(RowIndex) + "_");
					keyName = FormKeyName.Replace("k_", "k" + Convert.ToString(RowIndex) + "_");
					var BlankRowName = FormBlankRowName.Replace("k_", "k" + Convert.ToString(RowIndex) + "_");
					if (!Empty(RowAction))
						MultiSelectKey += "<input type=\"hidden\" name=\"" + actionName + "\" id=\"" + actionName + "\" value=\"" + RowAction + "\">";
					if (RowAction == "delete") {
						string rowkey = CurrentForm.GetValue(FormKeyName);
						SetupKeyValues(rowkey);
					}
					if (RowAction == "insert" && IsConfirm && EmptyRow())
						MultiSelectKey += "<input type=\"hidden\" name=\"" + BlankRowName + "\" id=\"" + BlankRowName + "\" value=\"1\">";
				}

				// "delete"
				if (AllowAddDeleteRow) {
					if (IsGridAdd || IsGridEdit) {
						var options = ListOptions;
						options.UseButtonGroup = true; // Use button group for grid delete button
						listOption = options["griddelete"];
						listOption.Body = "<a class=\"ew-grid-link ew-grid-delete\" title=\"" + HtmlTitle(Language.Phrase("DeleteLink")) + "\" data-caption=\"" + HtmlTitle(Language.Phrase("DeleteLink")) + "\" onclick=\"return ew.deleteGridRow(this, " + RowIndex + ");\">" + Language.Phrase("DeleteLink") + "</a>";
					}
				}

				// "view"
				listOption = ListOptions["view"];
				string viewcaption = HtmlTitle(Language.Phrase("ViewLink"));
				isVisible = true;
				if (isVisible) {
					listOption.Body = "<a class=\"ew-row-link ew-view\" title=\"" + viewcaption + "\" data-caption=\"" + viewcaption + "\" href=\"" + HtmlEncode(AppPath(ViewUrl)) + "\">" + Language.Phrase("ViewLink") + "</a>";
				} else {
					listOption.Body = "";
				}

				// "edit"
				listOption = ListOptions["edit"];
				string editcaption = HtmlTitle(Language.Phrase("EditLink"));
				isVisible = true;
				if (isVisible) {
					listOption.Body = "<a class=\"ew-row-link ew-edit\" title=\"" + editcaption + "\" data-caption=\"" + editcaption + "\" href=\"" + HtmlEncode(AppPath(EditUrl)) + "\">" + Language.Phrase("EditLink") + "</a>";
				} else {
					listOption.Body = "";
				}

				// "copy"
				listOption = ListOptions["copy"];
				string copycaption = HtmlTitle(Language.Phrase("CopyLink"));
				isVisible = true;
				if (isVisible) {
					listOption.Body = "<a class=\"ew-row-link ew-copy\" title=\"" + copycaption + "\" data-caption=\"" + copycaption + "\" href=\"" + HtmlEncode(AppPath(CopyUrl)) + "\">" + Language.Phrase("CopyLink") + "</a>";
				} else {
					listOption.Body = "";
				}

				// "delete"
				listOption = ListOptions["delete"];
				isVisible = true;
				if (isVisible)
					listOption.Body = "<a class=\"ew-row-link ew-delete\"" + "" + " title=\"" + HtmlTitle(Language.Phrase("DeleteLink")) + "\" data-caption=\"" + HtmlTitle(Language.Phrase("DeleteLink")) + "\" href=\"" + HtmlEncode(AppPath(DeleteUrl)) + "\">" + Language.Phrase("DeleteLink") + "</a>";
				else
					listOption.Body = "";

				// Set up list action buttons
				listOption = ListOptions["listactions"];
				if (listOption != null && !IsExport() && CurrentAction == "") {
					string body = "";
					var links = new List<string>();
					foreach (var (key, act) in ListActions.Items) {
						if (act.Select == Config.ActionSingle && act.Allowed) {
							var action = act.Action;
							string caption = act.Caption;
							var icon = (act.Icon != "") ? "<i class=\"" + HtmlEncode(act.Icon.Replace(" ew-icon", "")) + "\" data-caption=\"" + HtmlTitle(caption) + "\"></i> " : "";
							links.Add("<li><a class=\"dropdown-item ew-action ew-list-action\" data-action=\"" + HtmlEncode(action) + "\" data-caption=\"" + HtmlTitle(caption) + "\" href=\"\" onclick=\"ew.submitAction(event,jQuery.extend({key:" + KeyToJson() + "}," + act.ToJson(true) + ")); return false;\">" + icon + act.Caption + "</a></li>");
							if (links.Count == 1) // Single button
								body = "<a class=\"ew-action ew-list-action\" data-action=\"" + HtmlEncode(action) + "\" title=\"" + HtmlTitle(caption) + "\" data-caption=\"" + HtmlTitle(caption) + "\" href=\"\" onclick=\"ew.submitAction(event,jQuery.extend({key:" + KeyToJson() + "}," + act.ToJson(true) + ")); return false;\">" + Language.Phrase("ListActionButton") + "</a>";
						}
					}
					if (links.Count > 1) { // More than one buttons, use dropdown
						body = "<button class=\"dropdown-toggle btn btn-default ew-actions\" title=\"" + HtmlTitle(Language.Phrase("ListActionButton")) + "\" data-toggle=\"dropdown\">" + Language.Phrase("ListActionButton") + "</button>";
						string content = links.Aggregate("", (result, link) => result + "<li>" + link + "</li>");
						body += "<ul class=\"dropdown-menu" + (listOption.OnLeft ? "" : " dropdown-menu-right") + "\">" + content + "</ul>";
						body = "<div class=\"btn-group btn-group-sm\">" + body + "</div>";
					}
					if (links.Count > 0) {
						listOption.Body = body;
						listOption.Visible = true;
					}
				}

				// "checkbox2"
				listOption = ListOptions["checkbox"];
				listOption.Body = "<input type=\"checkbox\" name=\"key_m\" class=\"ew-multi-select\" value=\"" + HtmlEncode(OID.CurrentValue) + "\" onclick=\"ew.clickMultiCheckbox(event);\">";
				if (IsGridEdit && IsNumeric(RowIndex)) {
					MultiSelectKey += "<input type=\"hidden\" name=\"" + keyName + "\" id=\"" + keyName + "\" value=\"" + OID.CurrentValue + "\">";
				}
				RenderListOptionsExt();

				// Call ListOptions_Rendered event
				ListOptions_Rendered();
			}

			// Set up other options
			protected void SetupOtherOptions() {
				ListOptions option;
				ListOption item;
				var options = OtherOptions;
				option = options["addedit"];

				// Add
				item = option.Add("add");
				string addcaption = HtmlTitle(Language.Phrase("AddLink"));
				item.Body = "<a class=\"ew-add-edit ew-add\" title=\"" + addcaption + "\" data-caption=\"" + addcaption + "\" href=\"" + HtmlEncode(AppPath(AddUrl)) + "\">" + Language.Phrase("AddLink") + "</a>";
				item.Visible = (AddUrl != "");

				// Add grid edit
				option = options["addedit"];
				item = option.Add("gridedit");
				item.Body = "<a class=\"ew-add-edit ew-grid-edit\" title=\"" + HtmlTitle(Language.Phrase("GridEditLink")) + "\" data-caption=\"" + HtmlTitle(Language.Phrase("GridEditLink")) + "\" href=\"" + HtmlEncode(AppPath(GridEditUrl)) + "\">" + Language.Phrase("GridEditLink") + "</a>";
				item.Visible = (GridEditUrl != "");
				option = options["action"];

				// Set up options default
				foreach (var (key, opt) in options) {
					opt.UseDropDownButton = false;
					opt.UseButtonGroup = true;
					opt.ButtonClass = ""; // Class for button group
					item = opt.Add(opt.GroupOptionName);
					item.Body = "";
					item.Visible = false;
				}
				options["addedit"].DropDownButtonPhrase = Language.Phrase("ButtonAddEdit");
				options["detail"].DropDownButtonPhrase = Language.Phrase("ButtonDetails");
				options["action"].DropDownButtonPhrase = Language.Phrase("ButtonActions");

				// Filter button
				item = FilterOptions.Add("savecurrentfilter");
				item.Body = "<a class=\"ew-save-filter\" data-form=\"fINNCSUMPAlistsrch\" href=\"#\">" + Language.Phrase("SaveCurrentFilter") + "</a>";
				item.Visible = true;
				item = FilterOptions.Add("deletefilter");
				item.Body = "<a class=\"ew-delete-filter\" data-form=\"fINNCSUMPAlistsrch\" href=\"#\">" + Language.Phrase("DeleteFilter") + "</a>";
				item.Visible = true;
				FilterOptions.UseDropDownButton = true;
				FilterOptions.UseButtonGroup = !FilterOptions.UseDropDownButton;
				FilterOptions.DropDownButtonPhrase = Language.Phrase("Filters");

				// Add group option item
				item = FilterOptions.Add(FilterOptions.GroupOptionName);
				item.Body = "";
				item.Visible = false;
			}

			// Render other options
			public void RenderOtherOptions() {
				ListOptions option;
				ListOption item;
				var options = OtherOptions;
				if (!IsGridAdd && !IsGridEdit) { // Not grid add/edit mode
					option = options["action"];

					// Set up list action buttons
					foreach (var (key, act) in ListActions.Items.Where(kvp => kvp.Value.Select == Config.ActionMultiple)) {
						item = option.Add("custom_" + act.Action);
						string caption = act.Caption;
						var icon = (act.Icon != "") ? "<i class=\"" + HtmlEncode(act.Icon) + "\" data-caption=\"" + HtmlEncode(caption) + "\"></i> " + caption : caption;
						item.Body = "<a class=\"ew-action ew-list-action\" title=\"" + HtmlEncode(caption) + "\" data-caption=\"" + HtmlEncode(caption) + "\" href=\"\" onclick=\"ew.submitAction(event,jQuery.extend({f:document.fINNCSUMPAlist}," + act.ToJson(true) + ")); return false;\">" + icon + "</a>";
						item.Visible = act.Allowed;
					}

					// Hide grid edit and other options
					if (TotalRecords <= 0) {
						option = options["addedit"];
						item = option["gridedit"];
						if (item != null)
							item.Visible = false;
						option = options["action"];
						option.HideAllOptions();
					}
				} else { // Grid add/edit mode

					// Hide all options first
					foreach (var (key, opt) in options)
						opt.HideAllOptions();
					if (CurrentAction == "gridedit") {
						if (AllowAddDeleteRow) {

							// Add add blank row
							option = options["addedit"];
							option.UseDropDownButton = false;
							item = option.Add("addblankrow");
							item.Body = "<a class=\"ew-add-edit ew-add-blank-row\" title=\"" + HtmlTitle(Language.Phrase("AddBlankRow")) + "\" data-caption=\"" + HtmlTitle(Language.Phrase("AddBlankRow")) + "\" href=\"javascript:void(0);\" onclick=\"ew.addGridRow(this);\">" + Language.Phrase("AddBlankRow") + "</a>";
							item.Visible = true;
						}
						option = options["action"];
						option.UseDropDownButton = false;
							item = option.Add("gridsave");
							item.Body = "<a class=\"ew-action ew-grid-save\" title=\"" + HtmlTitle(Language.Phrase("GridSaveLink")) + "\" data-caption=\"" + HtmlTitle(Language.Phrase("GridSaveLink")) + "\" href=\"\" onclick=\"return ew.forms(this).submit('" + AppPath(PageName) + "');\">" + Language.Phrase("GridSaveLink") + "</a>";
							item = option.Add("gridcancel");
							item.Body = "<a class=\"ew-action ew-grid-cancel\" title=\"" + HtmlTitle(Language.Phrase("GridCancelLink")) + "\" data-caption=\"" + HtmlTitle(Language.Phrase("GridCancelLink")) + "\" href=\"" + HtmlEncode(AppPath(AddMasterUrl(PageUrl + "action=cancel"))) + "\">" + Language.Phrase("GridCancelLink") + "</a>";
					}
				}
			}

			// Process list action
			public async Task<IActionResult> ProcessListAction() {
				string filter = GetFilterFromRecordKeys();
				string userAction = Post("useraction");
				if (filter != "" && userAction != "") {

					// Check permission first
					var actionCaption = userAction;
					foreach (var (key, act) in ListActions.Items) {
						if (SameString(key, userAction)) {
							actionCaption = act.Caption;
							if (!act.Allowed) {
								string errmsg = Language.Phrase("CustomActionNotAllowed").Replace("%s", actionCaption);
								if (Post("ajax") == userAction) // Ajax
									return Controller.Content("<p class=\"text-danger\">" + errmsg + "</p>", "text/plain", Encoding.UTF8);
								else
									FailureMessage = errmsg;
								return null;
							}
						}
					}
					CurrentFilter = filter;
					string sql = CurrentSql;
					var rsuser = await Connection.GetRowsAsync(sql);
					CurrentAction = userAction;

					// Call row custom action event
					if (rsuser != null) {
						Connection.BeginTrans();
						bool processed = true;
						SelectedCount = rsuser.Count();
						SelectedIndex = 0;
						foreach (var row in rsuser) {
							SelectedIndex++;
							processed = Row_CustomAction(userAction, row);
							if (!processed)
								break;
						}
						if (processed) {
							Connection.CommitTrans(); // Commit the changes
							if (Empty(SuccessMessage))
								SuccessMessage = Language.Phrase("CustomActionCompleted").Replace("%s", actionCaption); // Set up success message
							} else {
								Connection.RollbackTrans(); // Rollback changes

							// Set up error message
							if (!Empty(SuccessMessage) || !Empty(FailureMessage)) {

								// Use the message, do nothing
							} else if (!Empty(CancelMessage)) {
								FailureMessage = CancelMessage;
								CancelMessage = "";
							} else {
								FailureMessage = Language.Phrase("CustomActionFailed").Replace("%s", actionCaption);
							}
						}
					}
					CurrentAction = ""; // Clear action
					if (Post("ajax") == userAction) { // Ajax
						if (ActionResult != null) // Action result set by Row_CustomAction // DN
							return ActionResult;
						string msg = "";
						if (SuccessMessage != "") {
							msg = "<p class=\"text-success\">" + SuccessMessage + "</p>";
							ClearSuccessMessage(); // Clear message
						}
						if (FailureMessage != "") {
							msg = "<p class=\"text-danger\">" + FailureMessage + "</p>";
							ClearFailureMessage(); // Clear message
						}
						if (!Empty(msg))
							return Controller.Content(msg, "text/plain", Encoding.UTF8);
					}
				}
				return null; // Not ajax request
			}

			// Set up search options
			protected void SetupSearchOptions() {
				ListOption item;
				SearchOptions = new ListOptions();
				SearchOptions.Tag = "div";
				SearchOptions.TagClassName = "ew-search-option";

				// Search button
				item = SearchOptions.Add("searchtoggle");
				var searchToggleClass = !Empty(SearchWhere) ? " active" : " active";
				item.Body = "<button type=\"button\" class=\"btn btn-default ew-search-toggle" + searchToggleClass + "\" title=\"" + Language.Phrase("SearchPanel") + "\" data-caption=\"" + Language.Phrase("SearchPanel") + "\" data-toggle=\"button\" data-form=\"fINNCSUMPAlistsrch\">" + Language.Phrase("SearchLink") + "</button>";
				item.Visible = true;

				// Show all button
				item = SearchOptions.Add("showall");
				item.Body = "<a class=\"btn btn-default ew-show-all\" title=\"" + Language.Phrase("ShowAll") + "\" data-caption=\"" + Language.Phrase("ShowAll") + "\" href=\"" + AppPath(PageUrl) + "cmd=reset\">" + Language.Phrase("ShowAllBtn") + "</a>";
				item.Visible = (SearchWhere != DefaultSearchWhere && SearchWhere != "0=101");

				// Button group for search
				SearchOptions.UseDropDownButton = false;
				SearchOptions.UseButtonGroup = true;
				SearchOptions.DropDownButtonPhrase = Language.Phrase("ButtonSearch");

				// Add group option item
				item = SearchOptions.Add(SearchOptions.GroupOptionName);
				item.Body = "";
				item.Visible = false;

				// Hide search options
				if (IsExport() || !Empty(CurrentAction))
					SearchOptions.HideAllOptions();
			}

			// Set up list options
			protected void SetupListOptionsExt() {
			}

			// Render list options
			protected void RenderListOptionsExt() {
			}

			// Set up starting record parameters
			public void SetupStartRec() {
				int pageNo;

				// Exit if DisplayRecords = 0
				if (DisplayRecords == 0)
					return;
				if (IsPageRequest) { // Validate request

					// Check for a "start" parameter
					if (IsNumeric(Get(Config.TableStartRec))) {
						StartRecord = Get<int>(Config.TableStartRec);
						StartRecordNumber = StartRecord;
					} else if (IsNumeric(Get(Config.TablePageNumber))) {
						pageNo = Get<int>(Config.TablePageNumber);
						StartRecord = (pageNo - 1) * DisplayRecords + 1;
						if (StartRecord <= 0) {
							StartRecord = 1;
						} else if (StartRecord >= ((TotalRecords - 1) / DisplayRecords) * DisplayRecords + 1) {
							StartRecord = ((TotalRecords - 1) / DisplayRecords) * DisplayRecords + 1;
						}
						StartRecordNumber = StartRecord;
					}
				}
				StartRecord = StartRecordNumber;

				// Check if correct start record counter
				if (StartRecord <= 0) { // Avoid invalid start record counter
					StartRecord = 1; // Reset start record counter
					StartRecordNumber = StartRecord;
				} else if (StartRecord > TotalRecords) { // Avoid starting record > total records
					StartRecord = ((TotalRecords - 1) / DisplayRecords) * DisplayRecords + 1; // Point to last page first record
					StartRecordNumber = StartRecord;
				} else if ((StartRecord - 1) % DisplayRecords != 0) {
					StartRecord = ((StartRecord - 1) / DisplayRecords) * DisplayRecords + 1; // Point to page boundary
					StartRecordNumber = StartRecord;
				}
			}

			// Load default values
			protected void LoadDefaultValues() {
				OID.CurrentValue = System.DBNull.Value;
				OID.OldValue = OID.CurrentValue;
				ADNINGRESO.CurrentValue = System.DBNull.Value;
				ADNINGRESO.OldValue = ADNINGRESO.CurrentValue;
				SLNORDSER.CurrentValue = System.DBNull.Value;
				SLNORDSER.OldValue = SLNORDSER.CurrentValue;
				ISCESTPRO.CurrentValue = System.DBNull.Value;
				ISCESTPRO.OldValue = ISCESTPRO.CurrentValue;
				GEENMedico.CurrentValue = System.DBNull.Value;
				GEENMedico.OldValue = GEENMedico.CurrentValue;
				INNALMACE.CurrentValue = System.DBNull.Value;
				INNALMACE.OldValue = INNALMACE.CurrentValue;
				GENARESER.CurrentValue = System.DBNull.Value;
				GENARESER.OldValue = GENARESER.CurrentValue;
				ISCDETALL.CurrentValue = System.DBNull.Value;
				ISCDETALL.OldValue = ISCDETALL.CurrentValue;
				GENARESER1.CurrentValue = System.DBNull.Value;
				GENARESER1.OldValue = GENARESER1.CurrentValue;
				ISCSUMIORIGEN.CurrentValue = System.DBNull.Value;
				ISCSUMIORIGEN.OldValue = ISCSUMIORIGEN.CurrentValue;
				ISCSUMIPENDI.CurrentValue = System.DBNull.Value;
				ISCSUMIPENDI.OldValue = ISCSUMIPENDI.CurrentValue;
				INNORDDESC.CurrentValue = System.DBNull.Value;
				INNORDDESC.OldValue = INNORDDESC.CurrentValue;
				ISCSUMGENPEN.CurrentValue = System.DBNull.Value;
				ISCSUMGENPEN.OldValue = ISCSUMGENPEN.CurrentValue;
				ISCVRBASINC.CurrentValue = System.DBNull.Value;
				ISCVRBASINC.OldValue = ISCVRBASINC.CurrentValue;
				ISCPORINCRE.CurrentValue = System.DBNull.Value;
				ISCPORINCRE.OldValue = ISCPORINCRE.CurrentValue;
				ISCPORINCRE1.CurrentValue = System.DBNull.Value;
				ISCPORINCRE1.OldValue = ISCPORINCRE1.CurrentValue;
				ISCVALINCRE.CurrentValue = System.DBNull.Value;
				ISCVALINCRE.OldValue = ISCVALINCRE.CurrentValue;
				ISCVALINCRE1.CurrentValue = System.DBNull.Value;
				ISCVALINCRE1.OldValue = ISCVALINCRE1.CurrentValue;
				ISCOIDORIHCRE.CurrentValue = System.DBNull.Value;
				ISCOIDORIHCRE.OldValue = ISCOIDORIHCRE.CurrentValue;
				ISCTIPSOLDIS.CurrentValue = System.DBNull.Value;
				ISCTIPSOLDIS.OldValue = ISCTIPSOLDIS.CurrentValue;
				INNDISFORREC.CurrentValue = System.DBNull.Value;
				INNDISFORREC.OldValue = INNDISFORREC.CurrentValue;
				INNPENDICAB.CurrentValue = System.DBNull.Value;
				INNPENDICAB.OldValue = INNPENDICAB.CurrentValue;
				ISCINDIDESA.CurrentValue = System.DBNull.Value;
				ISCINDIDESA.OldValue = ISCINDIDESA.CurrentValue;
				ISCJUSTIFICA.CurrentValue = System.DBNull.Value;
				ISCJUSTIFICA.OldValue = ISCJUSTIFICA.CurrentValue;
				ISCFECORIGEN.CurrentValue = System.DBNull.Value;
				ISCFECORIGEN.OldValue = ISCFECORIGEN.CurrentValue;
				ISCGFMIDFOR.CurrentValue = System.DBNull.Value;
				ISCGFMIDFOR.OldValue = ISCGFMIDFOR.CurrentValue;
				INNCPLAPRO.CurrentValue = System.DBNull.Value;
				INNCPLAPRO.OldValue = INNCPLAPRO.CurrentValue;
				INNCCONFIR.CurrentValue = System.DBNull.Value;
				INNCCONFIR.OldValue = INNCCONFIR.CurrentValue;
				INNCAUTCONFCOMPEN.CurrentValue = System.DBNull.Value;
				INNCAUTCONFCOMPEN.OldValue = INNCAUTCONFCOMPEN.CurrentValue;
				INNCAUTANULCOMPEN.CurrentValue = System.DBNull.Value;
				INNCAUTANULCOMPEN.OldValue = INNCAUTANULCOMPEN.CurrentValue;
				ISCINTERCOMPEN.CurrentValue = System.DBNull.Value;
				ISCINTERCOMPEN.OldValue = ISCINTERCOMPEN.CurrentValue;
				ISCMEDREMICOMPEN.CurrentValue = System.DBNull.Value;
				ISCMEDREMICOMPEN.OldValue = ISCMEDREMICOMPEN.CurrentValue;
				ISCNUMMESCOMPEN.CurrentValue = System.DBNull.Value;
				ISCNUMMESCOMPEN.OldValue = ISCNUMMESCOMPEN.CurrentValue;
			}

			// Load basic search values // DN
			protected void LoadBasicSearchValues() {
				if (Query.TryGetValue(Config.TableBasicSearch, out StringValues keyword))
					BasicSearch.Keyword = keyword;
				if (!Empty(BasicSearch.Keyword) && Empty(Command))
					Command = "search";
				if (Query.TryGetValue(Config.TableBasicSearchType, out StringValues type))
					BasicSearch.Type = type;
			}

			#pragma warning disable 1998

			// Load form values
			protected async Task LoadFormValues() {
				string val;

				// Check field name 'OID' first before field var 'x_OID'
				val = CurrentForm.GetValue("OID", "x_OID");
				if (!OID.IsDetailKey) {
					if (IsApi() && val == null)
						OID.Visible = false; // Disable update for API request
					else
						OID.FormValue = val;
				}

				// Check field name 'ADNINGRESO' first before field var 'x_ADNINGRESO'
				val = CurrentForm.GetValue("ADNINGRESO", "x_ADNINGRESO");
				if (!ADNINGRESO.IsDetailKey) {
					if (IsApi() && val == null)
						ADNINGRESO.Visible = false; // Disable update for API request
					else
						ADNINGRESO.FormValue = val;
				}

				// Check field name 'SLNORDSER' first before field var 'x_SLNORDSER'
				val = CurrentForm.GetValue("SLNORDSER", "x_SLNORDSER");
				if (!SLNORDSER.IsDetailKey) {
					if (IsApi() && val == null)
						SLNORDSER.Visible = false; // Disable update for API request
					else
						SLNORDSER.FormValue = val;
				}

				// Check field name 'ISCESTPRO' first before field var 'x_ISCESTPRO'
				val = CurrentForm.GetValue("ISCESTPRO", "x_ISCESTPRO");
				if (!ISCESTPRO.IsDetailKey) {
					if (IsApi() && val == null)
						ISCESTPRO.Visible = false; // Disable update for API request
					else
						ISCESTPRO.FormValue = val;
				}

				// Check field name 'GEENMedico' first before field var 'x_GEENMedico'
				val = CurrentForm.GetValue("GEENMedico", "x_GEENMedico");
				if (!GEENMedico.IsDetailKey) {
					if (IsApi() && val == null)
						GEENMedico.Visible = false; // Disable update for API request
					else
						GEENMedico.FormValue = val;
				}

				// Check field name 'INNALMACE' first before field var 'x_INNALMACE'
				val = CurrentForm.GetValue("INNALMACE", "x_INNALMACE");
				if (!INNALMACE.IsDetailKey) {
					if (IsApi() && val == null)
						INNALMACE.Visible = false; // Disable update for API request
					else
						INNALMACE.FormValue = val;
				}

				// Check field name 'GENARESER' first before field var 'x_GENARESER'
				val = CurrentForm.GetValue("GENARESER", "x_GENARESER");
				if (!GENARESER.IsDetailKey) {
					if (IsApi() && val == null)
						GENARESER.Visible = false; // Disable update for API request
					else
						GENARESER.FormValue = val;
				}

				// Check field name 'GENARESER1' first before field var 'x_GENARESER1'
				val = CurrentForm.GetValue("GENARESER1", "x_GENARESER1");
				if (!GENARESER1.IsDetailKey) {
					if (IsApi() && val == null)
						GENARESER1.Visible = false; // Disable update for API request
					else
						GENARESER1.FormValue = val;
				}

				// Check field name 'ISCSUMIORIGEN' first before field var 'x_ISCSUMIORIGEN'
				val = CurrentForm.GetValue("ISCSUMIORIGEN", "x_ISCSUMIORIGEN");
				if (!ISCSUMIORIGEN.IsDetailKey) {
					if (IsApi() && val == null)
						ISCSUMIORIGEN.Visible = false; // Disable update for API request
					else
						ISCSUMIORIGEN.FormValue = val;
				}

				// Check field name 'ISCSUMIPENDI' first before field var 'x_ISCSUMIPENDI'
				val = CurrentForm.GetValue("ISCSUMIPENDI", "x_ISCSUMIPENDI");
				if (!ISCSUMIPENDI.IsDetailKey) {
					if (IsApi() && val == null)
						ISCSUMIPENDI.Visible = false; // Disable update for API request
					else
						ISCSUMIPENDI.FormValue = val;
				}

				// Check field name 'INNORDDESC' first before field var 'x_INNORDDESC'
				val = CurrentForm.GetValue("INNORDDESC", "x_INNORDDESC");
				if (!INNORDDESC.IsDetailKey) {
					if (IsApi() && val == null)
						INNORDDESC.Visible = false; // Disable update for API request
					else
						INNORDDESC.FormValue = val;
				}

				// Check field name 'ISCSUMGENPEN' first before field var 'x_ISCSUMGENPEN'
				val = CurrentForm.GetValue("ISCSUMGENPEN", "x_ISCSUMGENPEN");
				if (!ISCSUMGENPEN.IsDetailKey) {
					if (IsApi() && val == null)
						ISCSUMGENPEN.Visible = false; // Disable update for API request
					else
						ISCSUMGENPEN.FormValue = val;
				}

				// Check field name 'ISCVRBASINC' first before field var 'x_ISCVRBASINC'
				val = CurrentForm.GetValue("ISCVRBASINC", "x_ISCVRBASINC");
				if (!ISCVRBASINC.IsDetailKey) {
					if (IsApi() && val == null)
						ISCVRBASINC.Visible = false; // Disable update for API request
					else
						ISCVRBASINC.FormValue = val;
				}

				// Check field name 'ISCPORINCRE' first before field var 'x_ISCPORINCRE'
				val = CurrentForm.GetValue("ISCPORINCRE", "x_ISCPORINCRE");
				if (!ISCPORINCRE.IsDetailKey) {
					if (IsApi() && val == null)
						ISCPORINCRE.Visible = false; // Disable update for API request
					else
						ISCPORINCRE.FormValue = val;
				}

				// Check field name 'ISCPORINCRE1' first before field var 'x_ISCPORINCRE1'
				val = CurrentForm.GetValue("ISCPORINCRE1", "x_ISCPORINCRE1");
				if (!ISCPORINCRE1.IsDetailKey) {
					if (IsApi() && val == null)
						ISCPORINCRE1.Visible = false; // Disable update for API request
					else
						ISCPORINCRE1.FormValue = val;
				}

				// Check field name 'ISCVALINCRE' first before field var 'x_ISCVALINCRE'
				val = CurrentForm.GetValue("ISCVALINCRE", "x_ISCVALINCRE");
				if (!ISCVALINCRE.IsDetailKey) {
					if (IsApi() && val == null)
						ISCVALINCRE.Visible = false; // Disable update for API request
					else
						ISCVALINCRE.FormValue = val;
				}

				// Check field name 'ISCVALINCRE1' first before field var 'x_ISCVALINCRE1'
				val = CurrentForm.GetValue("ISCVALINCRE1", "x_ISCVALINCRE1");
				if (!ISCVALINCRE1.IsDetailKey) {
					if (IsApi() && val == null)
						ISCVALINCRE1.Visible = false; // Disable update for API request
					else
						ISCVALINCRE1.FormValue = val;
				}

				// Check field name 'ISCOIDORIHCRE' first before field var 'x_ISCOIDORIHCRE'
				val = CurrentForm.GetValue("ISCOIDORIHCRE", "x_ISCOIDORIHCRE");
				if (!ISCOIDORIHCRE.IsDetailKey) {
					if (IsApi() && val == null)
						ISCOIDORIHCRE.Visible = false; // Disable update for API request
					else
						ISCOIDORIHCRE.FormValue = val;
				}

				// Check field name 'ISCTIPSOLDIS' first before field var 'x_ISCTIPSOLDIS'
				val = CurrentForm.GetValue("ISCTIPSOLDIS", "x_ISCTIPSOLDIS");
				if (!ISCTIPSOLDIS.IsDetailKey) {
					if (IsApi() && val == null)
						ISCTIPSOLDIS.Visible = false; // Disable update for API request
					else
						ISCTIPSOLDIS.FormValue = val;
				}

				// Check field name 'INNDISFORREC' first before field var 'x_INNDISFORREC'
				val = CurrentForm.GetValue("INNDISFORREC", "x_INNDISFORREC");
				if (!INNDISFORREC.IsDetailKey) {
					if (IsApi() && val == null)
						INNDISFORREC.Visible = false; // Disable update for API request
					else
						INNDISFORREC.FormValue = val;
				}

				// Check field name 'INNPENDICAB' first before field var 'x_INNPENDICAB'
				val = CurrentForm.GetValue("INNPENDICAB", "x_INNPENDICAB");
				if (!INNPENDICAB.IsDetailKey) {
					if (IsApi() && val == null)
						INNPENDICAB.Visible = false; // Disable update for API request
					else
						INNPENDICAB.FormValue = val;
				}

				// Check field name 'ISCINDIDESA' first before field var 'x_ISCINDIDESA'
				val = CurrentForm.GetValue("ISCINDIDESA", "x_ISCINDIDESA");
				if (!ISCINDIDESA.IsDetailKey) {
					if (IsApi() && val == null)
						ISCINDIDESA.Visible = false; // Disable update for API request
					else
						ISCINDIDESA.FormValue = val;
				}

				// Check field name 'ISCJUSTIFICA' first before field var 'x_ISCJUSTIFICA'
				val = CurrentForm.GetValue("ISCJUSTIFICA", "x_ISCJUSTIFICA");
				if (!ISCJUSTIFICA.IsDetailKey) {
					if (IsApi() && val == null)
						ISCJUSTIFICA.Visible = false; // Disable update for API request
					else
						ISCJUSTIFICA.FormValue = val;
				}

				// Check field name 'ISCFECORIGEN' first before field var 'x_ISCFECORIGEN'
				val = CurrentForm.GetValue("ISCFECORIGEN", "x_ISCFECORIGEN");
				if (!ISCFECORIGEN.IsDetailKey) {
					if (IsApi() && val == null)
						ISCFECORIGEN.Visible = false; // Disable update for API request
					else
						ISCFECORIGEN.FormValue = val;
					ISCFECORIGEN.CurrentValue = UnformatDateTime(ISCFECORIGEN.CurrentValue, 0);
				}

				// Check field name 'ISCGFMIDFOR' first before field var 'x_ISCGFMIDFOR'
				val = CurrentForm.GetValue("ISCGFMIDFOR", "x_ISCGFMIDFOR");
				if (!ISCGFMIDFOR.IsDetailKey) {
					if (IsApi() && val == null)
						ISCGFMIDFOR.Visible = false; // Disable update for API request
					else
						ISCGFMIDFOR.FormValue = val;
				}

				// Check field name 'INNCPLAPRO' first before field var 'x_INNCPLAPRO'
				val = CurrentForm.GetValue("INNCPLAPRO", "x_INNCPLAPRO");
				if (!INNCPLAPRO.IsDetailKey) {
					if (IsApi() && val == null)
						INNCPLAPRO.Visible = false; // Disable update for API request
					else
						INNCPLAPRO.FormValue = val;
				}

				// Check field name 'INNCCONFIR' first before field var 'x_INNCCONFIR'
				val = CurrentForm.GetValue("INNCCONFIR", "x_INNCCONFIR");
				if (!INNCCONFIR.IsDetailKey) {
					if (IsApi() && val == null)
						INNCCONFIR.Visible = false; // Disable update for API request
					else
						INNCCONFIR.FormValue = val;
				}

				// Check field name 'INNCAUTCONFCOMPEN' first before field var 'x_INNCAUTCONFCOMPEN'
				val = CurrentForm.GetValue("INNCAUTCONFCOMPEN", "x_INNCAUTCONFCOMPEN");
				if (!INNCAUTCONFCOMPEN.IsDetailKey) {
					if (IsApi() && val == null)
						INNCAUTCONFCOMPEN.Visible = false; // Disable update for API request
					else
						INNCAUTCONFCOMPEN.FormValue = val;
				}

				// Check field name 'INNCAUTANULCOMPEN' first before field var 'x_INNCAUTANULCOMPEN'
				val = CurrentForm.GetValue("INNCAUTANULCOMPEN", "x_INNCAUTANULCOMPEN");
				if (!INNCAUTANULCOMPEN.IsDetailKey) {
					if (IsApi() && val == null)
						INNCAUTANULCOMPEN.Visible = false; // Disable update for API request
					else
						INNCAUTANULCOMPEN.FormValue = val;
				}

				// Check field name 'ISCINTERCOMPEN' first before field var 'x_ISCINTERCOMPEN'
				val = CurrentForm.GetValue("ISCINTERCOMPEN", "x_ISCINTERCOMPEN");
				if (!ISCINTERCOMPEN.IsDetailKey) {
					if (IsApi() && val == null)
						ISCINTERCOMPEN.Visible = false; // Disable update for API request
					else
						ISCINTERCOMPEN.FormValue = val;
				}

				// Check field name 'ISCMEDREMICOMPEN' first before field var 'x_ISCMEDREMICOMPEN'
				val = CurrentForm.GetValue("ISCMEDREMICOMPEN", "x_ISCMEDREMICOMPEN");
				if (!ISCMEDREMICOMPEN.IsDetailKey) {
					if (IsApi() && val == null)
						ISCMEDREMICOMPEN.Visible = false; // Disable update for API request
					else
						ISCMEDREMICOMPEN.FormValue = val;
				}

				// Check field name 'ISCNUMMESCOMPEN' first before field var 'x_ISCNUMMESCOMPEN'
				val = CurrentForm.GetValue("ISCNUMMESCOMPEN", "x_ISCNUMMESCOMPEN");
				if (!ISCNUMMESCOMPEN.IsDetailKey) {
					if (IsApi() && val == null)
						ISCNUMMESCOMPEN.Visible = false; // Disable update for API request
					else
						ISCNUMMESCOMPEN.FormValue = val;
				}
			}

			#pragma warning restore 1998

			// Restore form values
			public void RestoreFormValues() {
				OID.CurrentValue = OID.FormValue;
				ADNINGRESO.CurrentValue = ADNINGRESO.FormValue;
				SLNORDSER.CurrentValue = SLNORDSER.FormValue;
				ISCESTPRO.CurrentValue = ISCESTPRO.FormValue;
				GEENMedico.CurrentValue = GEENMedico.FormValue;
				INNALMACE.CurrentValue = INNALMACE.FormValue;
				GENARESER.CurrentValue = GENARESER.FormValue;
				GENARESER1.CurrentValue = GENARESER1.FormValue;
				ISCSUMIORIGEN.CurrentValue = ISCSUMIORIGEN.FormValue;
				ISCSUMIPENDI.CurrentValue = ISCSUMIPENDI.FormValue;
				INNORDDESC.CurrentValue = INNORDDESC.FormValue;
				ISCSUMGENPEN.CurrentValue = ISCSUMGENPEN.FormValue;
				ISCVRBASINC.CurrentValue = ISCVRBASINC.FormValue;
				ISCPORINCRE.CurrentValue = ISCPORINCRE.FormValue;
				ISCPORINCRE1.CurrentValue = ISCPORINCRE1.FormValue;
				ISCVALINCRE.CurrentValue = ISCVALINCRE.FormValue;
				ISCVALINCRE1.CurrentValue = ISCVALINCRE1.FormValue;
				ISCOIDORIHCRE.CurrentValue = ISCOIDORIHCRE.FormValue;
				ISCTIPSOLDIS.CurrentValue = ISCTIPSOLDIS.FormValue;
				INNDISFORREC.CurrentValue = INNDISFORREC.FormValue;
				INNPENDICAB.CurrentValue = INNPENDICAB.FormValue;
				ISCINDIDESA.CurrentValue = ISCINDIDESA.FormValue;
				ISCJUSTIFICA.CurrentValue = ISCJUSTIFICA.FormValue;
				ISCFECORIGEN.CurrentValue = ISCFECORIGEN.FormValue;
				ISCFECORIGEN.CurrentValue = UnformatDateTime(ISCFECORIGEN.CurrentValue, 0);
				ISCGFMIDFOR.CurrentValue = ISCGFMIDFOR.FormValue;
				INNCPLAPRO.CurrentValue = INNCPLAPRO.FormValue;
				INNCCONFIR.CurrentValue = INNCCONFIR.FormValue;
				INNCAUTCONFCOMPEN.CurrentValue = INNCAUTCONFCOMPEN.FormValue;
				INNCAUTANULCOMPEN.CurrentValue = INNCAUTANULCOMPEN.FormValue;
				ISCINTERCOMPEN.CurrentValue = ISCINTERCOMPEN.FormValue;
				ISCMEDREMICOMPEN.CurrentValue = ISCMEDREMICOMPEN.FormValue;
				ISCNUMMESCOMPEN.CurrentValue = ISCNUMMESCOMPEN.FormValue;
			}

			// Load recordset // DN
			public async Task<DbDataReader> LoadRecordset(int offset = -1, int rowcnt = -1) {

				// Load list page SQL
				string sql = ListSql;

				// Load recordset (Recordset_Selected event not supported) // DN
				return await Connection.SelectLimit(sql, rowcnt, offset, !Empty(OrderBy) || !Empty(SessionOrderBy));
			}

			// Load row based on key values
			public async Task<bool> LoadRow() {
				string filter = GetRecordFilter();

				// Call Row Selecting event
				Row_Selecting(ref filter);

				// Load SQL based on filter
				CurrentFilter = filter;
				string sql = CurrentSql;
				bool res = false;
				try {
					using (var rsrow = await Connection.OpenDataReaderAsync(sql)) {
						if (rsrow != null && await rsrow.ReadAsync()) {
							await LoadRowValues(rsrow);
							if (!EventCancelled)
								HashValue = GetRowHash(rsrow); // Get hash value for record
							res = true;
						} else {
							return false;
						}
					}
				} catch {
					if (Config.Debug)
						throw;
				}
				return res;
			}

			#pragma warning disable 162, 168, 1998

			// Load row values from recordset
			public async Task LoadRowValues(DbDataReader dr = null) {
				Dictionary<string, object> row;
				object v;
				if (dr != null && dr.HasRows)
					row = Connection.GetRow(dr); // DN
				else
					row = NewRow();

				// Call Row Selected event
				Row_Selected(row);
				if (dr == null || !dr.HasRows)
					return;
				OID.SetDbValue(row["OID"]);
				ADNINGRESO.SetDbValue(row["ADNINGRESO"]);
				SLNORDSER.SetDbValue(row["SLNORDSER"]);
				ISCESTPRO.SetDbValue(row["ISCESTPRO"]);
				GEENMedico.SetDbValue(row["GEENMedico"]);
				INNALMACE.SetDbValue(row["INNALMACE"]);
				GENARESER.SetDbValue(row["GENARESER"]);
				ISCDETALL.SetDbValue(row["ISCDETALL"]);
				GENARESER1.SetDbValue(row["GENARESER1"]);
				ISCSUMIORIGEN.SetDbValue(row["ISCSUMIORIGEN"]);
				ISCSUMIPENDI.SetDbValue(row["ISCSUMIPENDI"]);
				INNORDDESC.SetDbValue(row["INNORDDESC"]);
				ISCSUMGENPEN.SetDbValue((ConvertToBool(row["ISCSUMGENPEN"]) ? "1" : "0"));
				ISCVRBASINC.SetDbValue(row["ISCVRBASINC"]);
				ISCPORINCRE.SetDbValue(row["ISCPORINCRE"]);
				ISCPORINCRE1.SetDbValue(row["ISCPORINCRE1"]);
				ISCVALINCRE.SetDbValue(row["ISCVALINCRE"]);
				ISCVALINCRE1.SetDbValue(row["ISCVALINCRE1"]);
				ISCOIDORIHCRE.SetDbValue(row["ISCOIDORIHCRE"]);
				ISCTIPSOLDIS.SetDbValue(row["ISCTIPSOLDIS"]);
				INNDISFORREC.SetDbValue(row["INNDISFORREC"]);
				INNPENDICAB.SetDbValue(row["INNPENDICAB"]);
				ISCINDIDESA.SetDbValue((ConvertToBool(row["ISCINDIDESA"]) ? "1" : "0"));
				ISCJUSTIFICA.SetDbValue(row["ISCJUSTIFICA"]);
				ISCFECORIGEN.SetDbValue(row["ISCFECORIGEN"]);
				ISCGFMIDFOR.SetDbValue(row["ISCGFMIDFOR"]);
				INNCPLAPRO.SetDbValue(row["INNCPLAPRO"]);
				INNCCONFIR.SetDbValue((ConvertToBool(row["INNCCONFIR"]) ? "1" : "0"));
				INNCAUTCONFCOMPEN.SetDbValue(row["INNCAUTCONFCOMPEN"]);
				INNCAUTANULCOMPEN.SetDbValue(row["INNCAUTANULCOMPEN"]);
				ISCINTERCOMPEN.SetDbValue((ConvertToBool(row["ISCINTERCOMPEN"]) ? "1" : "0"));
				ISCMEDREMICOMPEN.SetDbValue(row["ISCMEDREMICOMPEN"]);
				ISCNUMMESCOMPEN.SetDbValue(row["ISCNUMMESCOMPEN"]);
			}

			#pragma warning restore 162, 168, 1998

			// Return a row with default values
			protected Dictionary<string, object> NewRow() {
				LoadDefaultValues();
				var row = new Dictionary<string, object>();
				row.Add("OID", OID.CurrentValue);
				row.Add("ADNINGRESO", ADNINGRESO.CurrentValue);
				row.Add("SLNORDSER", SLNORDSER.CurrentValue);
				row.Add("ISCESTPRO", ISCESTPRO.CurrentValue);
				row.Add("GEENMedico", GEENMedico.CurrentValue);
				row.Add("INNALMACE", INNALMACE.CurrentValue);
				row.Add("GENARESER", GENARESER.CurrentValue);
				row.Add("ISCDETALL", ISCDETALL.CurrentValue);
				row.Add("GENARESER1", GENARESER1.CurrentValue);
				row.Add("ISCSUMIORIGEN", ISCSUMIORIGEN.CurrentValue);
				row.Add("ISCSUMIPENDI", ISCSUMIPENDI.CurrentValue);
				row.Add("INNORDDESC", INNORDDESC.CurrentValue);
				row.Add("ISCSUMGENPEN", ISCSUMGENPEN.CurrentValue);
				row.Add("ISCVRBASINC", ISCVRBASINC.CurrentValue);
				row.Add("ISCPORINCRE", ISCPORINCRE.CurrentValue);
				row.Add("ISCPORINCRE1", ISCPORINCRE1.CurrentValue);
				row.Add("ISCVALINCRE", ISCVALINCRE.CurrentValue);
				row.Add("ISCVALINCRE1", ISCVALINCRE1.CurrentValue);
				row.Add("ISCOIDORIHCRE", ISCOIDORIHCRE.CurrentValue);
				row.Add("ISCTIPSOLDIS", ISCTIPSOLDIS.CurrentValue);
				row.Add("INNDISFORREC", INNDISFORREC.CurrentValue);
				row.Add("INNPENDICAB", INNPENDICAB.CurrentValue);
				row.Add("ISCINDIDESA", ISCINDIDESA.CurrentValue);
				row.Add("ISCJUSTIFICA", ISCJUSTIFICA.CurrentValue);
				row.Add("ISCFECORIGEN", ISCFECORIGEN.CurrentValue);
				row.Add("ISCGFMIDFOR", ISCGFMIDFOR.CurrentValue);
				row.Add("INNCPLAPRO", INNCPLAPRO.CurrentValue);
				row.Add("INNCCONFIR", INNCCONFIR.CurrentValue);
				row.Add("INNCAUTCONFCOMPEN", INNCAUTCONFCOMPEN.CurrentValue);
				row.Add("INNCAUTANULCOMPEN", INNCAUTANULCOMPEN.CurrentValue);
				row.Add("ISCINTERCOMPEN", ISCINTERCOMPEN.CurrentValue);
				row.Add("ISCMEDREMICOMPEN", ISCMEDREMICOMPEN.CurrentValue);
				row.Add("ISCNUMMESCOMPEN", ISCNUMMESCOMPEN.CurrentValue);
				return row;
			}

			#pragma warning disable 618, 1998

			// Load old record
			protected async Task<bool> LoadOldRecord(DatabaseConnectionBase<SqlConnection, SqlCommand, SqlDataReader, SqlDbType> cnn = null) {
				bool validKey = true;
				if (!Empty(GetKey("OID")))
					OID.CurrentValue = GetKey("OID"); // OID
				else
					validKey = false;

				// Load old record
				OldRecordset = null;
				if (validKey) {
					CurrentFilter = GetRecordFilter();
					string sql = CurrentSql;
					try {
						if (cnn != null) {
							OldRecordset = await cnn.OpenDataReaderAsync(sql);
						 } else {
							OldRecordset = await Connection.OpenDataReaderAsync(sql);
						 }
						if (OldRecordset != null)
							await OldRecordset.ReadAsync();
					} catch {
						OldRecordset = null;
					}
				}
				await LoadRowValues(OldRecordset); // Load row values
				return validKey;
			}

			#pragma warning restore 618, 1998

			#pragma warning disable 1998

			// Render row values based on field settings
			public async Task RenderRow() {

				// Convert decimal values if posted back
				if (SameString(ISCVRBASINC.FormValue, ISCVRBASINC.CurrentValue) && IsNumeric(ConvertToFloatString(ISCVRBASINC.CurrentValue)))
					ISCVRBASINC.CurrentValue = ConvertToFloatString(ISCVRBASINC.CurrentValue);

				// Convert decimal values if posted back
				if (SameString(ISCPORINCRE.FormValue, ISCPORINCRE.CurrentValue) && IsNumeric(ConvertToFloatString(ISCPORINCRE.CurrentValue)))
					ISCPORINCRE.CurrentValue = ConvertToFloatString(ISCPORINCRE.CurrentValue);

				// Convert decimal values if posted back
				if (SameString(ISCPORINCRE1.FormValue, ISCPORINCRE1.CurrentValue) && IsNumeric(ConvertToFloatString(ISCPORINCRE1.CurrentValue)))
					ISCPORINCRE1.CurrentValue = ConvertToFloatString(ISCPORINCRE1.CurrentValue);

				// Convert decimal values if posted back
				if (SameString(ISCVALINCRE.FormValue, ISCVALINCRE.CurrentValue) && IsNumeric(ConvertToFloatString(ISCVALINCRE.CurrentValue)))
					ISCVALINCRE.CurrentValue = ConvertToFloatString(ISCVALINCRE.CurrentValue);

				// Convert decimal values if posted back
				if (SameString(ISCVALINCRE1.FormValue, ISCVALINCRE1.CurrentValue) && IsNumeric(ConvertToFloatString(ISCVALINCRE1.CurrentValue)))
					ISCVALINCRE1.CurrentValue = ConvertToFloatString(ISCVALINCRE1.CurrentValue);

				// Call Row_Rendering event
				Row_Rendering();

				// Common render codes for all row types
				// OID
				// ADNINGRESO
				// SLNORDSER
				// ISCESTPRO
				// GEENMedico
				// INNALMACE
				// GENARESER
				// ISCDETALL
				// GENARESER1
				// ISCSUMIORIGEN
				// ISCSUMIPENDI
				// INNORDDESC
				// ISCSUMGENPEN
				// ISCVRBASINC
				// ISCPORINCRE
				// ISCPORINCRE1
				// ISCVALINCRE
				// ISCVALINCRE1
				// ISCOIDORIHCRE
				// ISCTIPSOLDIS
				// INNDISFORREC
				// INNPENDICAB
				// ISCINDIDESA
				// ISCJUSTIFICA
				// ISCFECORIGEN
				// ISCGFMIDFOR
				// INNCPLAPRO
				// INNCCONFIR
				// INNCAUTCONFCOMPEN
				// INNCAUTANULCOMPEN
				// ISCINTERCOMPEN
				// ISCMEDREMICOMPEN
				// ISCNUMMESCOMPEN

				if (RowType == Config.RowTypeView) { // View row

					// OID
					OID.ViewValue = FormatNumber(OID.ViewValue, 0, -2, -2, -2);

					// ADNINGRESO
					ADNINGRESO.ViewValue = ADNINGRESO.CurrentValue;
					ADNINGRESO.ViewValue = FormatNumber(ADNINGRESO.ViewValue, 0, -2, -2, -2);

					// SLNORDSER
					SLNORDSER.ViewValue = SLNORDSER.CurrentValue;
					SLNORDSER.ViewValue = FormatNumber(SLNORDSER.ViewValue, 0, -2, -2, -2);

					// ISCESTPRO
					ISCESTPRO.ViewValue = ISCESTPRO.CurrentValue;
					ISCESTPRO.ViewValue = FormatNumber(ISCESTPRO.ViewValue, 0, -2, -2, -2);

					// GEENMedico
					GEENMedico.ViewValue = GEENMedico.CurrentValue;
					GEENMedico.ViewValue = FormatNumber(GEENMedico.ViewValue, 0, -2, -2, -2);

					// INNALMACE
					INNALMACE.ViewValue = INNALMACE.CurrentValue;
					INNALMACE.ViewValue = FormatNumber(INNALMACE.ViewValue, 0, -2, -2, -2);

					// GENARESER
					GENARESER.ViewValue = GENARESER.CurrentValue;
					GENARESER.ViewValue = FormatNumber(GENARESER.ViewValue, 0, -2, -2, -2);

					// GENARESER1
					GENARESER1.ViewValue = GENARESER1.CurrentValue;
					GENARESER1.ViewValue = FormatNumber(GENARESER1.ViewValue, 0, -2, -2, -2);

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.ViewValue = ISCSUMIORIGEN.CurrentValue;
					ISCSUMIORIGEN.ViewValue = FormatNumber(ISCSUMIORIGEN.ViewValue, 0, -2, -2, -2);

					// ISCSUMIPENDI
					ISCSUMIPENDI.ViewValue = ISCSUMIPENDI.CurrentValue;
					ISCSUMIPENDI.ViewValue = FormatNumber(ISCSUMIPENDI.ViewValue, 0, -2, -2, -2);

					// INNORDDESC
					INNORDDESC.ViewValue = INNORDDESC.CurrentValue;
					INNORDDESC.ViewValue = FormatNumber(INNORDDESC.ViewValue, 0, -2, -2, -2);

					// ISCSUMGENPEN
					if (ConvertToBool(ISCSUMGENPEN.CurrentValue)) {
						ISCSUMGENPEN.ViewValue = (ISCSUMGENPEN.TagCaption(1) != "") ? ISCSUMGENPEN.TagCaption(1) : "Yes";
					} else {
						ISCSUMGENPEN.ViewValue = (ISCSUMGENPEN.TagCaption(2) != "") ? ISCSUMGENPEN.TagCaption(2) : "No";
					}

					// ISCVRBASINC
					ISCVRBASINC.ViewValue = ISCVRBASINC.CurrentValue;
					ISCVRBASINC.ViewValue = FormatNumber(ISCVRBASINC.ViewValue, 2, -2, -2, -2);

					// ISCPORINCRE
					ISCPORINCRE.ViewValue = ISCPORINCRE.CurrentValue;
					ISCPORINCRE.ViewValue = FormatNumber(ISCPORINCRE.ViewValue, 2, -2, -2, -2);

					// ISCPORINCRE1
					ISCPORINCRE1.ViewValue = ISCPORINCRE1.CurrentValue;
					ISCPORINCRE1.ViewValue = FormatNumber(ISCPORINCRE1.ViewValue, 2, -2, -2, -2);

					// ISCVALINCRE
					ISCVALINCRE.ViewValue = ISCVALINCRE.CurrentValue;
					ISCVALINCRE.ViewValue = FormatNumber(ISCVALINCRE.ViewValue, 2, -2, -2, -2);

					// ISCVALINCRE1
					ISCVALINCRE1.ViewValue = ISCVALINCRE1.CurrentValue;
					ISCVALINCRE1.ViewValue = FormatNumber(ISCVALINCRE1.ViewValue, 2, -2, -2, -2);

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.ViewValue = ISCOIDORIHCRE.CurrentValue;
					ISCOIDORIHCRE.ViewValue = FormatNumber(ISCOIDORIHCRE.ViewValue, 0, -2, -2, -2);

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.ViewValue = ISCTIPSOLDIS.CurrentValue;
					ISCTIPSOLDIS.ViewValue = FormatNumber(ISCTIPSOLDIS.ViewValue, 0, -2, -2, -2);

					// INNDISFORREC
					INNDISFORREC.ViewValue = INNDISFORREC.CurrentValue;
					INNDISFORREC.ViewValue = FormatNumber(INNDISFORREC.ViewValue, 0, -2, -2, -2);

					// INNPENDICAB
					INNPENDICAB.ViewValue = INNPENDICAB.CurrentValue;
					INNPENDICAB.ViewValue = FormatNumber(INNPENDICAB.ViewValue, 0, -2, -2, -2);

					// ISCINDIDESA
					if (ConvertToBool(ISCINDIDESA.CurrentValue)) {
						ISCINDIDESA.ViewValue = (ISCINDIDESA.TagCaption(1) != "") ? ISCINDIDESA.TagCaption(1) : "Yes";
					} else {
						ISCINDIDESA.ViewValue = (ISCINDIDESA.TagCaption(2) != "") ? ISCINDIDESA.TagCaption(2) : "No";
					}

					// ISCJUSTIFICA
					ISCJUSTIFICA.ViewValue = ISCJUSTIFICA.CurrentValue;

					// ISCFECORIGEN
					ISCFECORIGEN.ViewValue = ISCFECORIGEN.CurrentValue;
					ISCFECORIGEN.ViewValue = FormatDateTime(ISCFECORIGEN.ViewValue, 0);

					// ISCGFMIDFOR
					ISCGFMIDFOR.ViewValue = ISCGFMIDFOR.CurrentValue;

					// INNCPLAPRO
					INNCPLAPRO.ViewValue = INNCPLAPRO.CurrentValue;
					INNCPLAPRO.ViewValue = FormatNumber(INNCPLAPRO.ViewValue, 0, -2, -2, -2);

					// INNCCONFIR
					if (ConvertToBool(INNCCONFIR.CurrentValue)) {
						INNCCONFIR.ViewValue = (INNCCONFIR.TagCaption(1) != "") ? INNCCONFIR.TagCaption(1) : "Yes";
					} else {
						INNCCONFIR.ViewValue = (INNCCONFIR.TagCaption(2) != "") ? INNCCONFIR.TagCaption(2) : "No";
					}

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.ViewValue = INNCAUTCONFCOMPEN.CurrentValue;

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.ViewValue = INNCAUTANULCOMPEN.CurrentValue;

					// ISCINTERCOMPEN
					if (ConvertToBool(ISCINTERCOMPEN.CurrentValue)) {
						ISCINTERCOMPEN.ViewValue = (ISCINTERCOMPEN.TagCaption(1) != "") ? ISCINTERCOMPEN.TagCaption(1) : "Yes";
					} else {
						ISCINTERCOMPEN.ViewValue = (ISCINTERCOMPEN.TagCaption(2) != "") ? ISCINTERCOMPEN.TagCaption(2) : "No";
					}

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.ViewValue = ISCMEDREMICOMPEN.CurrentValue;

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.ViewValue = ISCNUMMESCOMPEN.CurrentValue;
					ISCNUMMESCOMPEN.ViewValue = FormatNumber(ISCNUMMESCOMPEN.ViewValue, 0, -2, -2, -2);

					// OID
					OID.HrefValue = "";
					OID.TooltipValue = "";

					// ADNINGRESO
					ADNINGRESO.HrefValue = "";
					ADNINGRESO.TooltipValue = "";

					// SLNORDSER
					SLNORDSER.HrefValue = "";
					SLNORDSER.TooltipValue = "";

					// ISCESTPRO
					ISCESTPRO.HrefValue = "";
					ISCESTPRO.TooltipValue = "";

					// GEENMedico
					GEENMedico.HrefValue = "";
					GEENMedico.TooltipValue = "";

					// INNALMACE
					INNALMACE.HrefValue = "";
					INNALMACE.TooltipValue = "";

					// GENARESER
					GENARESER.HrefValue = "";
					GENARESER.TooltipValue = "";

					// GENARESER1
					GENARESER1.HrefValue = "";
					GENARESER1.TooltipValue = "";

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.HrefValue = "";
					ISCSUMIORIGEN.TooltipValue = "";

					// ISCSUMIPENDI
					ISCSUMIPENDI.HrefValue = "";
					ISCSUMIPENDI.TooltipValue = "";

					// INNORDDESC
					INNORDDESC.HrefValue = "";
					INNORDDESC.TooltipValue = "";

					// ISCSUMGENPEN
					ISCSUMGENPEN.HrefValue = "";
					ISCSUMGENPEN.TooltipValue = "";

					// ISCVRBASINC
					ISCVRBASINC.HrefValue = "";
					ISCVRBASINC.TooltipValue = "";

					// ISCPORINCRE
					ISCPORINCRE.HrefValue = "";
					ISCPORINCRE.TooltipValue = "";

					// ISCPORINCRE1
					ISCPORINCRE1.HrefValue = "";
					ISCPORINCRE1.TooltipValue = "";

					// ISCVALINCRE
					ISCVALINCRE.HrefValue = "";
					ISCVALINCRE.TooltipValue = "";

					// ISCVALINCRE1
					ISCVALINCRE1.HrefValue = "";
					ISCVALINCRE1.TooltipValue = "";

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.HrefValue = "";
					ISCOIDORIHCRE.TooltipValue = "";

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.HrefValue = "";
					ISCTIPSOLDIS.TooltipValue = "";

					// INNDISFORREC
					INNDISFORREC.HrefValue = "";
					INNDISFORREC.TooltipValue = "";

					// INNPENDICAB
					INNPENDICAB.HrefValue = "";
					INNPENDICAB.TooltipValue = "";

					// ISCINDIDESA
					ISCINDIDESA.HrefValue = "";
					ISCINDIDESA.TooltipValue = "";

					// ISCJUSTIFICA
					ISCJUSTIFICA.HrefValue = "";
					ISCJUSTIFICA.TooltipValue = "";

					// ISCFECORIGEN
					ISCFECORIGEN.HrefValue = "";
					ISCFECORIGEN.TooltipValue = "";

					// ISCGFMIDFOR
					ISCGFMIDFOR.HrefValue = "";
					ISCGFMIDFOR.TooltipValue = "";

					// INNCPLAPRO
					INNCPLAPRO.HrefValue = "";
					INNCPLAPRO.TooltipValue = "";

					// INNCCONFIR
					INNCCONFIR.HrefValue = "";
					INNCCONFIR.TooltipValue = "";

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.HrefValue = "";
					INNCAUTCONFCOMPEN.TooltipValue = "";

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.HrefValue = "";
					INNCAUTANULCOMPEN.TooltipValue = "";

					// ISCINTERCOMPEN
					ISCINTERCOMPEN.HrefValue = "";
					ISCINTERCOMPEN.TooltipValue = "";

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.HrefValue = "";
					ISCMEDREMICOMPEN.TooltipValue = "";

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.HrefValue = "";
					ISCNUMMESCOMPEN.TooltipValue = "";
				} else if (RowType == Config.RowTypeAdd) { // Add row

					// OID
					// ADNINGRESO

					ADNINGRESO.EditAttrs["class"] = "form-control";
					ADNINGRESO.EditValue = ADNINGRESO.CurrentValue; // DN
					ADNINGRESO.PlaceHolder = RemoveHtml(ADNINGRESO.Caption);

					// SLNORDSER
					SLNORDSER.EditAttrs["class"] = "form-control";
					SLNORDSER.EditValue = SLNORDSER.CurrentValue; // DN
					SLNORDSER.PlaceHolder = RemoveHtml(SLNORDSER.Caption);

					// ISCESTPRO
					ISCESTPRO.EditAttrs["class"] = "form-control";
					ISCESTPRO.EditValue = ISCESTPRO.CurrentValue; // DN
					ISCESTPRO.PlaceHolder = RemoveHtml(ISCESTPRO.Caption);

					// GEENMedico
					GEENMedico.EditAttrs["class"] = "form-control";
					GEENMedico.EditValue = GEENMedico.CurrentValue; // DN
					GEENMedico.PlaceHolder = RemoveHtml(GEENMedico.Caption);

					// INNALMACE
					INNALMACE.EditAttrs["class"] = "form-control";
					INNALMACE.EditValue = INNALMACE.CurrentValue; // DN
					INNALMACE.PlaceHolder = RemoveHtml(INNALMACE.Caption);

					// GENARESER
					GENARESER.EditAttrs["class"] = "form-control";
					GENARESER.EditValue = GENARESER.CurrentValue; // DN
					GENARESER.PlaceHolder = RemoveHtml(GENARESER.Caption);

					// GENARESER1
					GENARESER1.EditAttrs["class"] = "form-control";
					GENARESER1.EditValue = GENARESER1.CurrentValue; // DN
					GENARESER1.PlaceHolder = RemoveHtml(GENARESER1.Caption);

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.EditAttrs["class"] = "form-control";
					ISCSUMIORIGEN.EditValue = ISCSUMIORIGEN.CurrentValue; // DN
					ISCSUMIORIGEN.PlaceHolder = RemoveHtml(ISCSUMIORIGEN.Caption);

					// ISCSUMIPENDI
					ISCSUMIPENDI.EditAttrs["class"] = "form-control";
					ISCSUMIPENDI.EditValue = ISCSUMIPENDI.CurrentValue; // DN
					ISCSUMIPENDI.PlaceHolder = RemoveHtml(ISCSUMIPENDI.Caption);

					// INNORDDESC
					INNORDDESC.EditAttrs["class"] = "form-control";
					INNORDDESC.EditValue = INNORDDESC.CurrentValue; // DN
					INNORDDESC.PlaceHolder = RemoveHtml(INNORDDESC.Caption);

					// ISCSUMGENPEN
					ISCSUMGENPEN.EditValue = ISCSUMGENPEN.Options(false);

					// ISCVRBASINC
					ISCVRBASINC.EditAttrs["class"] = "form-control";
					ISCVRBASINC.EditValue = ISCVRBASINC.CurrentValue; // DN
					ISCVRBASINC.PlaceHolder = RemoveHtml(ISCVRBASINC.Caption);
					if (!Empty(ISCVRBASINC.EditValue) && IsNumeric(ISCVRBASINC.EditValue))
						ISCVRBASINC.EditValue = FormatNumber(ISCVRBASINC.EditValue, -2, -2, -2, -2);

					// ISCPORINCRE
					ISCPORINCRE.EditAttrs["class"] = "form-control";
					ISCPORINCRE.EditValue = ISCPORINCRE.CurrentValue; // DN
					ISCPORINCRE.PlaceHolder = RemoveHtml(ISCPORINCRE.Caption);
					if (!Empty(ISCPORINCRE.EditValue) && IsNumeric(ISCPORINCRE.EditValue))
						ISCPORINCRE.EditValue = FormatNumber(ISCPORINCRE.EditValue, -2, -2, -2, -2);

					// ISCPORINCRE1
					ISCPORINCRE1.EditAttrs["class"] = "form-control";
					ISCPORINCRE1.EditValue = ISCPORINCRE1.CurrentValue; // DN
					ISCPORINCRE1.PlaceHolder = RemoveHtml(ISCPORINCRE1.Caption);
					if (!Empty(ISCPORINCRE1.EditValue) && IsNumeric(ISCPORINCRE1.EditValue))
						ISCPORINCRE1.EditValue = FormatNumber(ISCPORINCRE1.EditValue, -2, -2, -2, -2);

					// ISCVALINCRE
					ISCVALINCRE.EditAttrs["class"] = "form-control";
					ISCVALINCRE.EditValue = ISCVALINCRE.CurrentValue; // DN
					ISCVALINCRE.PlaceHolder = RemoveHtml(ISCVALINCRE.Caption);
					if (!Empty(ISCVALINCRE.EditValue) && IsNumeric(ISCVALINCRE.EditValue))
						ISCVALINCRE.EditValue = FormatNumber(ISCVALINCRE.EditValue, -2, -2, -2, -2);

					// ISCVALINCRE1
					ISCVALINCRE1.EditAttrs["class"] = "form-control";
					ISCVALINCRE1.EditValue = ISCVALINCRE1.CurrentValue; // DN
					ISCVALINCRE1.PlaceHolder = RemoveHtml(ISCVALINCRE1.Caption);
					if (!Empty(ISCVALINCRE1.EditValue) && IsNumeric(ISCVALINCRE1.EditValue))
						ISCVALINCRE1.EditValue = FormatNumber(ISCVALINCRE1.EditValue, -2, -2, -2, -2);

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.EditAttrs["class"] = "form-control";
					ISCOIDORIHCRE.EditValue = ISCOIDORIHCRE.CurrentValue; // DN
					ISCOIDORIHCRE.PlaceHolder = RemoveHtml(ISCOIDORIHCRE.Caption);

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.EditAttrs["class"] = "form-control";
					ISCTIPSOLDIS.EditValue = ISCTIPSOLDIS.CurrentValue; // DN
					ISCTIPSOLDIS.PlaceHolder = RemoveHtml(ISCTIPSOLDIS.Caption);

					// INNDISFORREC
					INNDISFORREC.EditAttrs["class"] = "form-control";
					INNDISFORREC.EditValue = INNDISFORREC.CurrentValue; // DN
					INNDISFORREC.PlaceHolder = RemoveHtml(INNDISFORREC.Caption);

					// INNPENDICAB
					INNPENDICAB.EditAttrs["class"] = "form-control";
					INNPENDICAB.EditValue = INNPENDICAB.CurrentValue; // DN
					INNPENDICAB.PlaceHolder = RemoveHtml(INNPENDICAB.Caption);

					// ISCINDIDESA
					ISCINDIDESA.EditValue = ISCINDIDESA.Options(false);

					// ISCJUSTIFICA
					ISCJUSTIFICA.EditAttrs["class"] = "form-control";
					ISCJUSTIFICA.EditValue = ISCJUSTIFICA.CurrentValue; // DN
					ISCJUSTIFICA.PlaceHolder = RemoveHtml(ISCJUSTIFICA.Caption);

					// ISCFECORIGEN
					ISCFECORIGEN.EditAttrs["class"] = "form-control";
					ISCFECORIGEN.EditValue = FormatDateTime(ISCFECORIGEN.CurrentValue, 8); // DN
					ISCFECORIGEN.PlaceHolder = RemoveHtml(ISCFECORIGEN.Caption);

					// ISCGFMIDFOR
					ISCGFMIDFOR.EditAttrs["class"] = "form-control";
					ISCGFMIDFOR.EditValue = ISCGFMIDFOR.CurrentValue; // DN
					ISCGFMIDFOR.PlaceHolder = RemoveHtml(ISCGFMIDFOR.Caption);

					// INNCPLAPRO
					INNCPLAPRO.EditAttrs["class"] = "form-control";
					INNCPLAPRO.EditValue = INNCPLAPRO.CurrentValue; // DN
					INNCPLAPRO.PlaceHolder = RemoveHtml(INNCPLAPRO.Caption);

					// INNCCONFIR
					INNCCONFIR.EditValue = INNCCONFIR.Options(false);

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.EditAttrs["class"] = "form-control";
					INNCAUTCONFCOMPEN.EditValue = INNCAUTCONFCOMPEN.CurrentValue; // DN
					INNCAUTCONFCOMPEN.PlaceHolder = RemoveHtml(INNCAUTCONFCOMPEN.Caption);

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.EditAttrs["class"] = "form-control";
					INNCAUTANULCOMPEN.EditValue = INNCAUTANULCOMPEN.CurrentValue; // DN
					INNCAUTANULCOMPEN.PlaceHolder = RemoveHtml(INNCAUTANULCOMPEN.Caption);

					// ISCINTERCOMPEN
					ISCINTERCOMPEN.EditValue = ISCINTERCOMPEN.Options(false);

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.EditAttrs["class"] = "form-control";
					ISCMEDREMICOMPEN.EditValue = ISCMEDREMICOMPEN.CurrentValue; // DN
					ISCMEDREMICOMPEN.PlaceHolder = RemoveHtml(ISCMEDREMICOMPEN.Caption);

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.EditAttrs["class"] = "form-control";
					ISCNUMMESCOMPEN.EditValue = ISCNUMMESCOMPEN.CurrentValue; // DN
					ISCNUMMESCOMPEN.PlaceHolder = RemoveHtml(ISCNUMMESCOMPEN.Caption);

					// Add refer script
					// OID

					OID.HrefValue = "";

					// ADNINGRESO
					ADNINGRESO.HrefValue = "";

					// SLNORDSER
					SLNORDSER.HrefValue = "";

					// ISCESTPRO
					ISCESTPRO.HrefValue = "";

					// GEENMedico
					GEENMedico.HrefValue = "";

					// INNALMACE
					INNALMACE.HrefValue = "";

					// GENARESER
					GENARESER.HrefValue = "";

					// GENARESER1
					GENARESER1.HrefValue = "";

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.HrefValue = "";

					// ISCSUMIPENDI
					ISCSUMIPENDI.HrefValue = "";

					// INNORDDESC
					INNORDDESC.HrefValue = "";

					// ISCSUMGENPEN
					ISCSUMGENPEN.HrefValue = "";

					// ISCVRBASINC
					ISCVRBASINC.HrefValue = "";

					// ISCPORINCRE
					ISCPORINCRE.HrefValue = "";

					// ISCPORINCRE1
					ISCPORINCRE1.HrefValue = "";

					// ISCVALINCRE
					ISCVALINCRE.HrefValue = "";

					// ISCVALINCRE1
					ISCVALINCRE1.HrefValue = "";

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.HrefValue = "";

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.HrefValue = "";

					// INNDISFORREC
					INNDISFORREC.HrefValue = "";

					// INNPENDICAB
					INNPENDICAB.HrefValue = "";

					// ISCINDIDESA
					ISCINDIDESA.HrefValue = "";

					// ISCJUSTIFICA
					ISCJUSTIFICA.HrefValue = "";

					// ISCFECORIGEN
					ISCFECORIGEN.HrefValue = "";

					// ISCGFMIDFOR
					ISCGFMIDFOR.HrefValue = "";

					// INNCPLAPRO
					INNCPLAPRO.HrefValue = "";

					// INNCCONFIR
					INNCCONFIR.HrefValue = "";

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.HrefValue = "";

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.HrefValue = "";

					// ISCINTERCOMPEN
					ISCINTERCOMPEN.HrefValue = "";

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.HrefValue = "";

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.HrefValue = "";
				} else if (RowType == Config.RowTypeEdit) { // Edit row

					// OID
					OID.EditAttrs["class"] = "form-control";
					OID.EditValue = FormatNumber(OID.EditValue, 0, -2, -2, -2);

					// ADNINGRESO
					ADNINGRESO.EditAttrs["class"] = "form-control";
					ADNINGRESO.EditValue = ADNINGRESO.CurrentValue; // DN
					ADNINGRESO.PlaceHolder = RemoveHtml(ADNINGRESO.Caption);

					// SLNORDSER
					SLNORDSER.EditAttrs["class"] = "form-control";
					SLNORDSER.EditValue = SLNORDSER.CurrentValue; // DN
					SLNORDSER.PlaceHolder = RemoveHtml(SLNORDSER.Caption);

					// ISCESTPRO
					ISCESTPRO.EditAttrs["class"] = "form-control";
					ISCESTPRO.EditValue = ISCESTPRO.CurrentValue; // DN
					ISCESTPRO.PlaceHolder = RemoveHtml(ISCESTPRO.Caption);

					// GEENMedico
					GEENMedico.EditAttrs["class"] = "form-control";
					GEENMedico.EditValue = GEENMedico.CurrentValue; // DN
					GEENMedico.PlaceHolder = RemoveHtml(GEENMedico.Caption);

					// INNALMACE
					INNALMACE.EditAttrs["class"] = "form-control";
					INNALMACE.EditValue = INNALMACE.CurrentValue; // DN
					INNALMACE.PlaceHolder = RemoveHtml(INNALMACE.Caption);

					// GENARESER
					GENARESER.EditAttrs["class"] = "form-control";
					GENARESER.EditValue = GENARESER.CurrentValue; // DN
					GENARESER.PlaceHolder = RemoveHtml(GENARESER.Caption);

					// GENARESER1
					GENARESER1.EditAttrs["class"] = "form-control";
					GENARESER1.EditValue = GENARESER1.CurrentValue; // DN
					GENARESER1.PlaceHolder = RemoveHtml(GENARESER1.Caption);

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.EditAttrs["class"] = "form-control";
					ISCSUMIORIGEN.EditValue = ISCSUMIORIGEN.CurrentValue; // DN
					ISCSUMIORIGEN.PlaceHolder = RemoveHtml(ISCSUMIORIGEN.Caption);

					// ISCSUMIPENDI
					ISCSUMIPENDI.EditAttrs["class"] = "form-control";
					ISCSUMIPENDI.EditValue = ISCSUMIPENDI.CurrentValue; // DN
					ISCSUMIPENDI.PlaceHolder = RemoveHtml(ISCSUMIPENDI.Caption);

					// INNORDDESC
					INNORDDESC.EditAttrs["class"] = "form-control";
					INNORDDESC.EditValue = INNORDDESC.CurrentValue; // DN
					INNORDDESC.PlaceHolder = RemoveHtml(INNORDDESC.Caption);

					// ISCSUMGENPEN
					ISCSUMGENPEN.EditValue = ISCSUMGENPEN.Options(false);

					// ISCVRBASINC
					ISCVRBASINC.EditAttrs["class"] = "form-control";
					ISCVRBASINC.EditValue = ISCVRBASINC.CurrentValue; // DN
					ISCVRBASINC.PlaceHolder = RemoveHtml(ISCVRBASINC.Caption);
					if (!Empty(ISCVRBASINC.EditValue) && IsNumeric(ISCVRBASINC.EditValue))
						ISCVRBASINC.EditValue = FormatNumber(ISCVRBASINC.EditValue, -2, -2, -2, -2);

					// ISCPORINCRE
					ISCPORINCRE.EditAttrs["class"] = "form-control";
					ISCPORINCRE.EditValue = ISCPORINCRE.CurrentValue; // DN
					ISCPORINCRE.PlaceHolder = RemoveHtml(ISCPORINCRE.Caption);
					if (!Empty(ISCPORINCRE.EditValue) && IsNumeric(ISCPORINCRE.EditValue))
						ISCPORINCRE.EditValue = FormatNumber(ISCPORINCRE.EditValue, -2, -2, -2, -2);

					// ISCPORINCRE1
					ISCPORINCRE1.EditAttrs["class"] = "form-control";
					ISCPORINCRE1.EditValue = ISCPORINCRE1.CurrentValue; // DN
					ISCPORINCRE1.PlaceHolder = RemoveHtml(ISCPORINCRE1.Caption);
					if (!Empty(ISCPORINCRE1.EditValue) && IsNumeric(ISCPORINCRE1.EditValue))
						ISCPORINCRE1.EditValue = FormatNumber(ISCPORINCRE1.EditValue, -2, -2, -2, -2);

					// ISCVALINCRE
					ISCVALINCRE.EditAttrs["class"] = "form-control";
					ISCVALINCRE.EditValue = ISCVALINCRE.CurrentValue; // DN
					ISCVALINCRE.PlaceHolder = RemoveHtml(ISCVALINCRE.Caption);
					if (!Empty(ISCVALINCRE.EditValue) && IsNumeric(ISCVALINCRE.EditValue))
						ISCVALINCRE.EditValue = FormatNumber(ISCVALINCRE.EditValue, -2, -2, -2, -2);

					// ISCVALINCRE1
					ISCVALINCRE1.EditAttrs["class"] = "form-control";
					ISCVALINCRE1.EditValue = ISCVALINCRE1.CurrentValue; // DN
					ISCVALINCRE1.PlaceHolder = RemoveHtml(ISCVALINCRE1.Caption);
					if (!Empty(ISCVALINCRE1.EditValue) && IsNumeric(ISCVALINCRE1.EditValue))
						ISCVALINCRE1.EditValue = FormatNumber(ISCVALINCRE1.EditValue, -2, -2, -2, -2);

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.EditAttrs["class"] = "form-control";
					ISCOIDORIHCRE.EditValue = ISCOIDORIHCRE.CurrentValue; // DN
					ISCOIDORIHCRE.PlaceHolder = RemoveHtml(ISCOIDORIHCRE.Caption);

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.EditAttrs["class"] = "form-control";
					ISCTIPSOLDIS.EditValue = ISCTIPSOLDIS.CurrentValue; // DN
					ISCTIPSOLDIS.PlaceHolder = RemoveHtml(ISCTIPSOLDIS.Caption);

					// INNDISFORREC
					INNDISFORREC.EditAttrs["class"] = "form-control";
					INNDISFORREC.EditValue = INNDISFORREC.CurrentValue; // DN
					INNDISFORREC.PlaceHolder = RemoveHtml(INNDISFORREC.Caption);

					// INNPENDICAB
					INNPENDICAB.EditAttrs["class"] = "form-control";
					INNPENDICAB.EditValue = INNPENDICAB.CurrentValue; // DN
					INNPENDICAB.PlaceHolder = RemoveHtml(INNPENDICAB.Caption);

					// ISCINDIDESA
					ISCINDIDESA.EditValue = ISCINDIDESA.Options(false);

					// ISCJUSTIFICA
					ISCJUSTIFICA.EditAttrs["class"] = "form-control";
					ISCJUSTIFICA.EditValue = ISCJUSTIFICA.CurrentValue; // DN
					ISCJUSTIFICA.PlaceHolder = RemoveHtml(ISCJUSTIFICA.Caption);

					// ISCFECORIGEN
					ISCFECORIGEN.EditAttrs["class"] = "form-control";
					ISCFECORIGEN.EditValue = FormatDateTime(ISCFECORIGEN.CurrentValue, 8); // DN
					ISCFECORIGEN.PlaceHolder = RemoveHtml(ISCFECORIGEN.Caption);

					// ISCGFMIDFOR
					ISCGFMIDFOR.EditAttrs["class"] = "form-control";
					ISCGFMIDFOR.EditValue = ISCGFMIDFOR.CurrentValue; // DN
					ISCGFMIDFOR.PlaceHolder = RemoveHtml(ISCGFMIDFOR.Caption);

					// INNCPLAPRO
					INNCPLAPRO.EditAttrs["class"] = "form-control";
					INNCPLAPRO.EditValue = INNCPLAPRO.CurrentValue; // DN
					INNCPLAPRO.PlaceHolder = RemoveHtml(INNCPLAPRO.Caption);

					// INNCCONFIR
					INNCCONFIR.EditValue = INNCCONFIR.Options(false);

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.EditAttrs["class"] = "form-control";
					INNCAUTCONFCOMPEN.EditValue = INNCAUTCONFCOMPEN.CurrentValue; // DN
					INNCAUTCONFCOMPEN.PlaceHolder = RemoveHtml(INNCAUTCONFCOMPEN.Caption);

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.EditAttrs["class"] = "form-control";
					INNCAUTANULCOMPEN.EditValue = INNCAUTANULCOMPEN.CurrentValue; // DN
					INNCAUTANULCOMPEN.PlaceHolder = RemoveHtml(INNCAUTANULCOMPEN.Caption);

					// ISCINTERCOMPEN
					ISCINTERCOMPEN.EditValue = ISCINTERCOMPEN.Options(false);

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.EditAttrs["class"] = "form-control";
					ISCMEDREMICOMPEN.EditValue = ISCMEDREMICOMPEN.CurrentValue; // DN
					ISCMEDREMICOMPEN.PlaceHolder = RemoveHtml(ISCMEDREMICOMPEN.Caption);

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.EditAttrs["class"] = "form-control";
					ISCNUMMESCOMPEN.EditValue = ISCNUMMESCOMPEN.CurrentValue; // DN
					ISCNUMMESCOMPEN.PlaceHolder = RemoveHtml(ISCNUMMESCOMPEN.Caption);

					// Edit refer script
					// OID

					OID.HrefValue = "";

					// ADNINGRESO
					ADNINGRESO.HrefValue = "";

					// SLNORDSER
					SLNORDSER.HrefValue = "";

					// ISCESTPRO
					ISCESTPRO.HrefValue = "";

					// GEENMedico
					GEENMedico.HrefValue = "";

					// INNALMACE
					INNALMACE.HrefValue = "";

					// GENARESER
					GENARESER.HrefValue = "";

					// GENARESER1
					GENARESER1.HrefValue = "";

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.HrefValue = "";

					// ISCSUMIPENDI
					ISCSUMIPENDI.HrefValue = "";

					// INNORDDESC
					INNORDDESC.HrefValue = "";

					// ISCSUMGENPEN
					ISCSUMGENPEN.HrefValue = "";

					// ISCVRBASINC
					ISCVRBASINC.HrefValue = "";

					// ISCPORINCRE
					ISCPORINCRE.HrefValue = "";

					// ISCPORINCRE1
					ISCPORINCRE1.HrefValue = "";

					// ISCVALINCRE
					ISCVALINCRE.HrefValue = "";

					// ISCVALINCRE1
					ISCVALINCRE1.HrefValue = "";

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.HrefValue = "";

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.HrefValue = "";

					// INNDISFORREC
					INNDISFORREC.HrefValue = "";

					// INNPENDICAB
					INNPENDICAB.HrefValue = "";

					// ISCINDIDESA
					ISCINDIDESA.HrefValue = "";

					// ISCJUSTIFICA
					ISCJUSTIFICA.HrefValue = "";

					// ISCFECORIGEN
					ISCFECORIGEN.HrefValue = "";

					// ISCGFMIDFOR
					ISCGFMIDFOR.HrefValue = "";

					// INNCPLAPRO
					INNCPLAPRO.HrefValue = "";

					// INNCCONFIR
					INNCCONFIR.HrefValue = "";

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.HrefValue = "";

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.HrefValue = "";

					// ISCINTERCOMPEN
					ISCINTERCOMPEN.HrefValue = "";

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.HrefValue = "";

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.HrefValue = "";
				}
				if (RowType == Config.RowTypeAdd || RowType == Config.RowTypeEdit || RowType == Config.RowTypeSearch) // Add/Edit/Search row
					SetupFieldTitles();

				// Call Row Rendered event
				if (RowType != Config.RowTypeAggregateInit)
					Row_Rendered();
			}

			#pragma warning restore 1998

			#pragma warning disable 1998

			// Validate form
			protected async Task<bool> ValidateForm() {

				// Initialize form error message
				FormError = "";

				// Check if validation required
				if (!Config.ServerValidate)
					return (FormError == "");
				if (OID.Required) {
					if (Empty(OID.FormValue))
						FormError = AddMessage(FormError, OID.RequiredErrorMessage.Replace("%s", OID.Caption));
				}
				if (ADNINGRESO.Required) {
					if (!ADNINGRESO.IsDetailKey && Empty(ADNINGRESO.FormValue))
						FormError = AddMessage(FormError, ADNINGRESO.RequiredErrorMessage.Replace("%s", ADNINGRESO.Caption));
				}
				if (!CheckInteger(ADNINGRESO.FormValue))
					FormError = AddMessage(FormError, ADNINGRESO.ErrorMessage);
				if (SLNORDSER.Required) {
					if (!SLNORDSER.IsDetailKey && Empty(SLNORDSER.FormValue))
						FormError = AddMessage(FormError, SLNORDSER.RequiredErrorMessage.Replace("%s", SLNORDSER.Caption));
				}
				if (!CheckInteger(SLNORDSER.FormValue))
					FormError = AddMessage(FormError, SLNORDSER.ErrorMessage);
				if (ISCESTPRO.Required) {
					if (!ISCESTPRO.IsDetailKey && Empty(ISCESTPRO.FormValue))
						FormError = AddMessage(FormError, ISCESTPRO.RequiredErrorMessage.Replace("%s", ISCESTPRO.Caption));
				}
				if (!CheckInteger(ISCESTPRO.FormValue))
					FormError = AddMessage(FormError, ISCESTPRO.ErrorMessage);
				if (GEENMedico.Required) {
					if (!GEENMedico.IsDetailKey && Empty(GEENMedico.FormValue))
						FormError = AddMessage(FormError, GEENMedico.RequiredErrorMessage.Replace("%s", GEENMedico.Caption));
				}
				if (!CheckInteger(GEENMedico.FormValue))
					FormError = AddMessage(FormError, GEENMedico.ErrorMessage);
				if (INNALMACE.Required) {
					if (!INNALMACE.IsDetailKey && Empty(INNALMACE.FormValue))
						FormError = AddMessage(FormError, INNALMACE.RequiredErrorMessage.Replace("%s", INNALMACE.Caption));
				}
				if (!CheckInteger(INNALMACE.FormValue))
					FormError = AddMessage(FormError, INNALMACE.ErrorMessage);
				if (GENARESER.Required) {
					if (!GENARESER.IsDetailKey && Empty(GENARESER.FormValue))
						FormError = AddMessage(FormError, GENARESER.RequiredErrorMessage.Replace("%s", GENARESER.Caption));
				}
				if (!CheckInteger(GENARESER.FormValue))
					FormError = AddMessage(FormError, GENARESER.ErrorMessage);
				if (ISCDETALL.Required) {
					if (!ISCDETALL.IsDetailKey && Empty(ISCDETALL.FormValue))
						FormError = AddMessage(FormError, ISCDETALL.RequiredErrorMessage.Replace("%s", ISCDETALL.Caption));
				}
				if (GENARESER1.Required) {
					if (!GENARESER1.IsDetailKey && Empty(GENARESER1.FormValue))
						FormError = AddMessage(FormError, GENARESER1.RequiredErrorMessage.Replace("%s", GENARESER1.Caption));
				}
				if (!CheckInteger(GENARESER1.FormValue))
					FormError = AddMessage(FormError, GENARESER1.ErrorMessage);
				if (ISCSUMIORIGEN.Required) {
					if (!ISCSUMIORIGEN.IsDetailKey && Empty(ISCSUMIORIGEN.FormValue))
						FormError = AddMessage(FormError, ISCSUMIORIGEN.RequiredErrorMessage.Replace("%s", ISCSUMIORIGEN.Caption));
				}
				if (!CheckInteger(ISCSUMIORIGEN.FormValue))
					FormError = AddMessage(FormError, ISCSUMIORIGEN.ErrorMessage);
				if (ISCSUMIPENDI.Required) {
					if (!ISCSUMIPENDI.IsDetailKey && Empty(ISCSUMIPENDI.FormValue))
						FormError = AddMessage(FormError, ISCSUMIPENDI.RequiredErrorMessage.Replace("%s", ISCSUMIPENDI.Caption));
				}
				if (!CheckInteger(ISCSUMIPENDI.FormValue))
					FormError = AddMessage(FormError, ISCSUMIPENDI.ErrorMessage);
				if (INNORDDESC.Required) {
					if (!INNORDDESC.IsDetailKey && Empty(INNORDDESC.FormValue))
						FormError = AddMessage(FormError, INNORDDESC.RequiredErrorMessage.Replace("%s", INNORDDESC.Caption));
				}
				if (!CheckInteger(INNORDDESC.FormValue))
					FormError = AddMessage(FormError, INNORDDESC.ErrorMessage);
				if (ISCSUMGENPEN.Required) {
					if (Empty(ISCSUMGENPEN.FormValue))
						FormError = AddMessage(FormError, ISCSUMGENPEN.RequiredErrorMessage.Replace("%s", ISCSUMGENPEN.Caption));
				}
				if (ISCVRBASINC.Required) {
					if (!ISCVRBASINC.IsDetailKey && Empty(ISCVRBASINC.FormValue))
						FormError = AddMessage(FormError, ISCVRBASINC.RequiredErrorMessage.Replace("%s", ISCVRBASINC.Caption));
				}
				if (!CheckNumber(ISCVRBASINC.FormValue))
					FormError = AddMessage(FormError, ISCVRBASINC.ErrorMessage);
				if (ISCPORINCRE.Required) {
					if (!ISCPORINCRE.IsDetailKey && Empty(ISCPORINCRE.FormValue))
						FormError = AddMessage(FormError, ISCPORINCRE.RequiredErrorMessage.Replace("%s", ISCPORINCRE.Caption));
				}
				if (!CheckNumber(ISCPORINCRE.FormValue))
					FormError = AddMessage(FormError, ISCPORINCRE.ErrorMessage);
				if (ISCPORINCRE1.Required) {
					if (!ISCPORINCRE1.IsDetailKey && Empty(ISCPORINCRE1.FormValue))
						FormError = AddMessage(FormError, ISCPORINCRE1.RequiredErrorMessage.Replace("%s", ISCPORINCRE1.Caption));
				}
				if (!CheckNumber(ISCPORINCRE1.FormValue))
					FormError = AddMessage(FormError, ISCPORINCRE1.ErrorMessage);
				if (ISCVALINCRE.Required) {
					if (!ISCVALINCRE.IsDetailKey && Empty(ISCVALINCRE.FormValue))
						FormError = AddMessage(FormError, ISCVALINCRE.RequiredErrorMessage.Replace("%s", ISCVALINCRE.Caption));
				}
				if (!CheckNumber(ISCVALINCRE.FormValue))
					FormError = AddMessage(FormError, ISCVALINCRE.ErrorMessage);
				if (ISCVALINCRE1.Required) {
					if (!ISCVALINCRE1.IsDetailKey && Empty(ISCVALINCRE1.FormValue))
						FormError = AddMessage(FormError, ISCVALINCRE1.RequiredErrorMessage.Replace("%s", ISCVALINCRE1.Caption));
				}
				if (!CheckNumber(ISCVALINCRE1.FormValue))
					FormError = AddMessage(FormError, ISCVALINCRE1.ErrorMessage);
				if (ISCOIDORIHCRE.Required) {
					if (!ISCOIDORIHCRE.IsDetailKey && Empty(ISCOIDORIHCRE.FormValue))
						FormError = AddMessage(FormError, ISCOIDORIHCRE.RequiredErrorMessage.Replace("%s", ISCOIDORIHCRE.Caption));
				}
				if (!CheckInteger(ISCOIDORIHCRE.FormValue))
					FormError = AddMessage(FormError, ISCOIDORIHCRE.ErrorMessage);
				if (ISCTIPSOLDIS.Required) {
					if (!ISCTIPSOLDIS.IsDetailKey && Empty(ISCTIPSOLDIS.FormValue))
						FormError = AddMessage(FormError, ISCTIPSOLDIS.RequiredErrorMessage.Replace("%s", ISCTIPSOLDIS.Caption));
				}
				if (!CheckInteger(ISCTIPSOLDIS.FormValue))
					FormError = AddMessage(FormError, ISCTIPSOLDIS.ErrorMessage);
				if (INNDISFORREC.Required) {
					if (!INNDISFORREC.IsDetailKey && Empty(INNDISFORREC.FormValue))
						FormError = AddMessage(FormError, INNDISFORREC.RequiredErrorMessage.Replace("%s", INNDISFORREC.Caption));
				}
				if (!CheckInteger(INNDISFORREC.FormValue))
					FormError = AddMessage(FormError, INNDISFORREC.ErrorMessage);
				if (INNPENDICAB.Required) {
					if (!INNPENDICAB.IsDetailKey && Empty(INNPENDICAB.FormValue))
						FormError = AddMessage(FormError, INNPENDICAB.RequiredErrorMessage.Replace("%s", INNPENDICAB.Caption));
				}
				if (!CheckInteger(INNPENDICAB.FormValue))
					FormError = AddMessage(FormError, INNPENDICAB.ErrorMessage);
				if (ISCINDIDESA.Required) {
					if (Empty(ISCINDIDESA.FormValue))
						FormError = AddMessage(FormError, ISCINDIDESA.RequiredErrorMessage.Replace("%s", ISCINDIDESA.Caption));
				}
				if (ISCJUSTIFICA.Required) {
					if (!ISCJUSTIFICA.IsDetailKey && Empty(ISCJUSTIFICA.FormValue))
						FormError = AddMessage(FormError, ISCJUSTIFICA.RequiredErrorMessage.Replace("%s", ISCJUSTIFICA.Caption));
				}
				if (ISCFECORIGEN.Required) {
					if (!ISCFECORIGEN.IsDetailKey && Empty(ISCFECORIGEN.FormValue))
						FormError = AddMessage(FormError, ISCFECORIGEN.RequiredErrorMessage.Replace("%s", ISCFECORIGEN.Caption));
				}
				if (!CheckDate(ISCFECORIGEN.FormValue))
					FormError = AddMessage(FormError, ISCFECORIGEN.ErrorMessage);
				if (ISCGFMIDFOR.Required) {
					if (!ISCGFMIDFOR.IsDetailKey && Empty(ISCGFMIDFOR.FormValue))
						FormError = AddMessage(FormError, ISCGFMIDFOR.RequiredErrorMessage.Replace("%s", ISCGFMIDFOR.Caption));
				}
				if (INNCPLAPRO.Required) {
					if (!INNCPLAPRO.IsDetailKey && Empty(INNCPLAPRO.FormValue))
						FormError = AddMessage(FormError, INNCPLAPRO.RequiredErrorMessage.Replace("%s", INNCPLAPRO.Caption));
				}
				if (!CheckInteger(INNCPLAPRO.FormValue))
					FormError = AddMessage(FormError, INNCPLAPRO.ErrorMessage);
				if (INNCCONFIR.Required) {
					if (Empty(INNCCONFIR.FormValue))
						FormError = AddMessage(FormError, INNCCONFIR.RequiredErrorMessage.Replace("%s", INNCCONFIR.Caption));
				}
				if (INNCAUTCONFCOMPEN.Required) {
					if (!INNCAUTCONFCOMPEN.IsDetailKey && Empty(INNCAUTCONFCOMPEN.FormValue))
						FormError = AddMessage(FormError, INNCAUTCONFCOMPEN.RequiredErrorMessage.Replace("%s", INNCAUTCONFCOMPEN.Caption));
				}
				if (INNCAUTANULCOMPEN.Required) {
					if (!INNCAUTANULCOMPEN.IsDetailKey && Empty(INNCAUTANULCOMPEN.FormValue))
						FormError = AddMessage(FormError, INNCAUTANULCOMPEN.RequiredErrorMessage.Replace("%s", INNCAUTANULCOMPEN.Caption));
				}
				if (ISCINTERCOMPEN.Required) {
					if (Empty(ISCINTERCOMPEN.FormValue))
						FormError = AddMessage(FormError, ISCINTERCOMPEN.RequiredErrorMessage.Replace("%s", ISCINTERCOMPEN.Caption));
				}
				if (ISCMEDREMICOMPEN.Required) {
					if (!ISCMEDREMICOMPEN.IsDetailKey && Empty(ISCMEDREMICOMPEN.FormValue))
						FormError = AddMessage(FormError, ISCMEDREMICOMPEN.RequiredErrorMessage.Replace("%s", ISCMEDREMICOMPEN.Caption));
				}
				if (ISCNUMMESCOMPEN.Required) {
					if (!ISCNUMMESCOMPEN.IsDetailKey && Empty(ISCNUMMESCOMPEN.FormValue))
						FormError = AddMessage(FormError, ISCNUMMESCOMPEN.RequiredErrorMessage.Replace("%s", ISCNUMMESCOMPEN.Caption));
				}
				if (!CheckInteger(ISCNUMMESCOMPEN.FormValue))
					FormError = AddMessage(FormError, ISCNUMMESCOMPEN.ErrorMessage);

				// Return validate result
				bool valid = Empty(FormError);

				// Call Form_CustomValidate event
				string formCustomError = "";
				valid = valid && Form_CustomValidate(ref formCustomError);
				FormError = AddMessage(FormError, formCustomError);
				return valid;
			}

			#pragma warning restore 1998

			// Delete records (based on current filter)
			protected async Task<JsonBoolResult> DeleteRows() { // DN
				bool result = true;
				List<Dictionary<string, object>> rsold = null;
				try {
					string sql = CurrentSql;
					using (var rs = await Connection.GetDataReaderAsync(sql)) {
						if (rs == null) {
							return JsonBoolResult.FalseResult;
						} else if (!rs.HasRows) {
							FailureMessage = Language.Phrase("NoRecord"); // No record found
							return JsonBoolResult.FalseResult;
						} else { // Clone old rows
							rsold = await Connection.GetRowsAsync(rs);
						}
					}
				} catch (Exception e) {
					if (Config.Debug)
						throw;
					FailureMessage = e.Message;
					return JsonBoolResult.FalseResult;
				}
				INNCSUMPA = INNCSUMPA ?? new _INNCSUMPA();
				var key = "";
				try {

					// Call Row Deleting event
					if (result)
						result = rsold.All(row => Row_Deleting(row));
					if (result) {
						foreach (var row in rsold) {
							var thisKey = "";
							if (!Empty(thisKey)) thisKey += Config.CompositeKeySeparator;
							thisKey += Convert.ToString(row["OID"]);
							if (Config.DeleteUploadFiles)
								DeleteUploadedFiles(row);
							try {
								await DeleteAsync(row);
							} catch (Exception e) {
								if (Config.Debug)
									throw;
								FailureMessage = e.Message; // Set up error message
								result = false;
								break;
							}
							if (!Empty(key))
								key += ", ";
							key += thisKey;
						}
					} 
					if (!result) {

						// Set up error message
						if (!Empty(SuccessMessage) || !Empty(FailureMessage)) {

							// Use the message, do nothing
						} else if (!Empty(CancelMessage)) {
							FailureMessage = CancelMessage;
							CancelMessage = "";
						} else {
							FailureMessage = Language.Phrase("DeleteCancelled");
						}
					}
				} catch (Exception e) {
					FailureMessage = e.Message;
					result = false;
				}

				// Call Row Deleted event
				if (result)
					rsold.ForEach(row => Row_Deleted(row));

				// Write JSON for API request (Support single row only)
				var d = new Dictionary<string, object>();
				d.Add("success", result);
				if (IsApi() && result) {
					var row = GetRecordFromRecordset(rsold);
					d.Add(TableVar, row);
					d.Add("version", Config.ProductVersion);
					return new JsonBoolResult(d, true);
				}
				return new JsonBoolResult(d, result);
			}

			// Update record based on key values

			#pragma warning disable 168, 219

			protected async Task<JsonBoolResult> EditRow() { // DN
				bool result = false;
				Dictionary<string, object> rsold = null;
				var rsnew = new Dictionary<string, object>();
				var filter = GetRecordFilter();
				filter = ApplyUserIDFilters(filter);
				CurrentFilter = filter;
				string sql = CurrentSql;
				try {
					using (var rsedit = await Connection.GetDataReaderAsync(sql)) {
						if (rsedit == null || !await rsedit.ReadAsync()) {
							FailureMessage = Language.Phrase("NoRecord"); // Set no record message
							return JsonBoolResult.FalseResult;
						}
						rsold = Connection.GetRow(rsedit);
						LoadDbValues(rsold);
					}
				} catch (Exception e) {
					if (Config.Debug)
						throw;
					FailureMessage = e.Message;
					return JsonBoolResult.FalseResult;
				}

				// OID
				// ADNINGRESO

				ADNINGRESO.SetDbValue(rsnew, ADNINGRESO.CurrentValue, System.DBNull.Value, ADNINGRESO.ReadOnly);

				// SLNORDSER
				SLNORDSER.SetDbValue(rsnew, SLNORDSER.CurrentValue, System.DBNull.Value, SLNORDSER.ReadOnly);

				// ISCESTPRO
				ISCESTPRO.SetDbValue(rsnew, ISCESTPRO.CurrentValue, System.DBNull.Value, ISCESTPRO.ReadOnly);

				// GEENMedico
				GEENMedico.SetDbValue(rsnew, GEENMedico.CurrentValue, System.DBNull.Value, GEENMedico.ReadOnly);

				// INNALMACE
				INNALMACE.SetDbValue(rsnew, INNALMACE.CurrentValue, System.DBNull.Value, INNALMACE.ReadOnly);

				// GENARESER
				GENARESER.SetDbValue(rsnew, GENARESER.CurrentValue, System.DBNull.Value, GENARESER.ReadOnly);

				// GENARESER1
				GENARESER1.SetDbValue(rsnew, GENARESER1.CurrentValue, System.DBNull.Value, GENARESER1.ReadOnly);

				// ISCSUMIORIGEN
				ISCSUMIORIGEN.SetDbValue(rsnew, ISCSUMIORIGEN.CurrentValue, System.DBNull.Value, ISCSUMIORIGEN.ReadOnly);

				// ISCSUMIPENDI
				ISCSUMIPENDI.SetDbValue(rsnew, ISCSUMIPENDI.CurrentValue, System.DBNull.Value, ISCSUMIPENDI.ReadOnly);

				// INNORDDESC
				INNORDDESC.SetDbValue(rsnew, INNORDDESC.CurrentValue, System.DBNull.Value, INNORDDESC.ReadOnly);

				// ISCSUMGENPEN
				ISCSUMGENPEN.SetDbValue(rsnew, ConvertToBool(ISCSUMGENPEN.CurrentValue, "1", "0"), System.DBNull.Value, ISCSUMGENPEN.ReadOnly); // DN1204

				// ISCVRBASINC
				ISCVRBASINC.SetDbValue(rsnew, ISCVRBASINC.CurrentValue, System.DBNull.Value, ISCVRBASINC.ReadOnly);

				// ISCPORINCRE
				ISCPORINCRE.SetDbValue(rsnew, ISCPORINCRE.CurrentValue, System.DBNull.Value, ISCPORINCRE.ReadOnly);

				// ISCPORINCRE1
				ISCPORINCRE1.SetDbValue(rsnew, ISCPORINCRE1.CurrentValue, System.DBNull.Value, ISCPORINCRE1.ReadOnly);

				// ISCVALINCRE
				ISCVALINCRE.SetDbValue(rsnew, ISCVALINCRE.CurrentValue, System.DBNull.Value, ISCVALINCRE.ReadOnly);

				// ISCVALINCRE1
				ISCVALINCRE1.SetDbValue(rsnew, ISCVALINCRE1.CurrentValue, System.DBNull.Value, ISCVALINCRE1.ReadOnly);

				// ISCOIDORIHCRE
				ISCOIDORIHCRE.SetDbValue(rsnew, ISCOIDORIHCRE.CurrentValue, System.DBNull.Value, ISCOIDORIHCRE.ReadOnly);

				// ISCTIPSOLDIS
				ISCTIPSOLDIS.SetDbValue(rsnew, ISCTIPSOLDIS.CurrentValue, System.DBNull.Value, ISCTIPSOLDIS.ReadOnly);

				// INNDISFORREC
				INNDISFORREC.SetDbValue(rsnew, INNDISFORREC.CurrentValue, System.DBNull.Value, INNDISFORREC.ReadOnly);

				// INNPENDICAB
				INNPENDICAB.SetDbValue(rsnew, INNPENDICAB.CurrentValue, System.DBNull.Value, INNPENDICAB.ReadOnly);

				// ISCINDIDESA
				ISCINDIDESA.SetDbValue(rsnew, ConvertToBool(ISCINDIDESA.CurrentValue, "1", "0"), System.DBNull.Value, ISCINDIDESA.ReadOnly); // DN1204

				// ISCJUSTIFICA
				ISCJUSTIFICA.SetDbValue(rsnew, ISCJUSTIFICA.CurrentValue, System.DBNull.Value, ISCJUSTIFICA.ReadOnly);

				// ISCFECORIGEN
				ISCFECORIGEN.SetDbValue(rsnew, UnformatDateTime(ISCFECORIGEN.CurrentValue, 0), System.DBNull.Value, ISCFECORIGEN.ReadOnly);

				// ISCGFMIDFOR
				ISCGFMIDFOR.SetDbValue(rsnew, ISCGFMIDFOR.CurrentValue, System.DBNull.Value, ISCGFMIDFOR.ReadOnly);

				// INNCPLAPRO
				INNCPLAPRO.SetDbValue(rsnew, INNCPLAPRO.CurrentValue, System.DBNull.Value, INNCPLAPRO.ReadOnly);

				// INNCCONFIR
				INNCCONFIR.SetDbValue(rsnew, ConvertToBool(INNCCONFIR.CurrentValue, "1", "0"), System.DBNull.Value, INNCCONFIR.ReadOnly); // DN1204

				// INNCAUTCONFCOMPEN
				INNCAUTCONFCOMPEN.SetDbValue(rsnew, INNCAUTCONFCOMPEN.CurrentValue, System.DBNull.Value, INNCAUTCONFCOMPEN.ReadOnly);

				// INNCAUTANULCOMPEN
				INNCAUTANULCOMPEN.SetDbValue(rsnew, INNCAUTANULCOMPEN.CurrentValue, System.DBNull.Value, INNCAUTANULCOMPEN.ReadOnly);

				// ISCINTERCOMPEN
				ISCINTERCOMPEN.SetDbValue(rsnew, ConvertToBool(ISCINTERCOMPEN.CurrentValue, "1", "0"), System.DBNull.Value, ISCINTERCOMPEN.ReadOnly); // DN1204

				// ISCMEDREMICOMPEN
				ISCMEDREMICOMPEN.SetDbValue(rsnew, ISCMEDREMICOMPEN.CurrentValue, System.DBNull.Value, ISCMEDREMICOMPEN.ReadOnly);

				// ISCNUMMESCOMPEN
				ISCNUMMESCOMPEN.SetDbValue(rsnew, ISCNUMMESCOMPEN.CurrentValue, System.DBNull.Value, ISCNUMMESCOMPEN.ReadOnly);

				// Call Row Updating event
				bool updateRow = Row_Updating(rsold, rsnew);
				if (updateRow) {
					try {
						if (rsnew.Count > 0)
							result = await UpdateAsync(rsnew, "", rsold) > 0;
						else
							result = true;
						if (result) {
						}
					} catch (Exception e) {
						if (Config.Debug)
							throw;
						FailureMessage = e.Message;
						return JsonBoolResult.FalseResult;
					}
				} else {
					if (!Empty(SuccessMessage) || !Empty(FailureMessage)) {

						// Use the message, do nothing
					} else if (!Empty(CancelMessage)) {
						FailureMessage = CancelMessage;
						CancelMessage = "";
					} else {
						FailureMessage = Language.Phrase("UpdateCancelled");
					}
					result = false;
				}

				// Call Row_Updated event
				if (result)
					Row_Updated(rsold, rsnew);

				// Write JSON for API request
				var d = new Dictionary<string, object>();
				d.Add("success", result);
				if (IsApi() && result) {
					var row = GetRecordFromDictionary(rsnew);
					d.Add(TableVar, row);
					d.Add("version", Config.ProductVersion);
					return new JsonBoolResult(d, true);
				}
				return new JsonBoolResult(d, result);
			}

			// Save data to memory cache
			public void SetCache<T>(string key, T value, int span) => Cache.Set<T>(key, value, new MemoryCacheEntryOptions()
				.SetSlidingExpiration(TimeSpan.FromMilliseconds(span))); // Keep in cache for this time, reset time if accessed

			// Gete data from memory cache
			public void GetCache<T>(string key) => Cache.Get<T>(key);

			// Load row hash
			protected async Task LoadRowHash() {
				string filter = GetRecordFilter();

				// Load SQL based on filter
				CurrentFilter = filter;
				string sql = CurrentSql;
				try {
					using (var rsrow = await Connection.OpenDataReaderAsync(sql)) {
						if (rsrow != null && await rsrow.ReadAsync()) {
							HashValue = GetRowHash(rsrow);
						} else {
							HashValue = "";
						}
					}
				} catch {
					if (Config.Debug)
						throw;
					HashValue = "";
				}
			}

			// Get Row Hash
			public string GetRowHash(Dictionary<string, object> row) {
				string hash = "";
				if (row == null)
					return "";
				hash += GetFieldHash(row["OID"], Config.DataTypeNumber); // OID
				hash += GetFieldHash(row["ADNINGRESO"], Config.DataTypeNumber); // ADNINGRESO
				hash += GetFieldHash(row["SLNORDSER"], Config.DataTypeNumber); // SLNORDSER
				hash += GetFieldHash(row["ISCESTPRO"], Config.DataTypeNumber); // ISCESTPRO
				hash += GetFieldHash(row["GEENMedico"], Config.DataTypeNumber); // GEENMedico
				hash += GetFieldHash(row["INNALMACE"], Config.DataTypeNumber); // INNALMACE
				hash += GetFieldHash(row["GENARESER"], Config.DataTypeNumber); // GENARESER
				hash += GetFieldHash(row["GENARESER1"], Config.DataTypeNumber); // GENARESER1
				hash += GetFieldHash(row["ISCSUMIORIGEN"], Config.DataTypeNumber); // ISCSUMIORIGEN
				hash += GetFieldHash(row["ISCSUMIPENDI"], Config.DataTypeNumber); // ISCSUMIPENDI
				hash += GetFieldHash(row["INNORDDESC"], Config.DataTypeNumber); // INNORDDESC
				hash += GetFieldHash(row["ISCSUMGENPEN"], Config.DataTypeBoolean); // ISCSUMGENPEN
				hash += GetFieldHash(row["ISCVRBASINC"], Config.DataTypeNumber); // ISCVRBASINC
				hash += GetFieldHash(row["ISCPORINCRE"], Config.DataTypeNumber); // ISCPORINCRE
				hash += GetFieldHash(row["ISCPORINCRE1"], Config.DataTypeNumber); // ISCPORINCRE1
				hash += GetFieldHash(row["ISCVALINCRE"], Config.DataTypeNumber); // ISCVALINCRE
				hash += GetFieldHash(row["ISCVALINCRE1"], Config.DataTypeNumber); // ISCVALINCRE1
				hash += GetFieldHash(row["ISCOIDORIHCRE"], Config.DataTypeNumber); // ISCOIDORIHCRE
				hash += GetFieldHash(row["ISCTIPSOLDIS"], Config.DataTypeNumber); // ISCTIPSOLDIS
				hash += GetFieldHash(row["INNDISFORREC"], Config.DataTypeNumber); // INNDISFORREC
				hash += GetFieldHash(row["INNPENDICAB"], Config.DataTypeNumber); // INNPENDICAB
				hash += GetFieldHash(row["ISCINDIDESA"], Config.DataTypeBoolean); // ISCINDIDESA
				hash += GetFieldHash(row["ISCJUSTIFICA"], Config.DataTypeString); // ISCJUSTIFICA
				hash += GetFieldHash(row["ISCFECORIGEN"], Config.DataTypeDate); // ISCFECORIGEN
				hash += GetFieldHash(row["ISCGFMIDFOR"], Config.DataTypeString); // ISCGFMIDFOR
				hash += GetFieldHash(row["INNCPLAPRO"], Config.DataTypeNumber); // INNCPLAPRO
				hash += GetFieldHash(row["INNCCONFIR"], Config.DataTypeBoolean); // INNCCONFIR
				hash += GetFieldHash(row["INNCAUTCONFCOMPEN"], Config.DataTypeString); // INNCAUTCONFCOMPEN
				hash += GetFieldHash(row["INNCAUTANULCOMPEN"], Config.DataTypeString); // INNCAUTANULCOMPEN
				hash += GetFieldHash(row["ISCINTERCOMPEN"], Config.DataTypeBoolean); // ISCINTERCOMPEN
				hash += GetFieldHash(row["ISCMEDREMICOMPEN"], Config.DataTypeString); // ISCMEDREMICOMPEN
				hash += GetFieldHash(row["ISCNUMMESCOMPEN"], Config.DataTypeNumber); // ISCNUMMESCOMPEN
				return hash;
			}

			// Get Row Hash
			public string GetRowHash(DbDataReader dr) {
				var row = new Dictionary<string, object>();
				row.Add("OID", dr["OID"]); // OID
				row.Add("ADNINGRESO", dr["ADNINGRESO"]); // ADNINGRESO
				row.Add("SLNORDSER", dr["SLNORDSER"]); // SLNORDSER
				row.Add("ISCESTPRO", dr["ISCESTPRO"]); // ISCESTPRO
				row.Add("GEENMedico", dr["GEENMedico"]); // GEENMedico
				row.Add("INNALMACE", dr["INNALMACE"]); // INNALMACE
				row.Add("GENARESER", dr["GENARESER"]); // GENARESER
				row.Add("GENARESER1", dr["GENARESER1"]); // GENARESER1
				row.Add("ISCSUMIORIGEN", dr["ISCSUMIORIGEN"]); // ISCSUMIORIGEN
				row.Add("ISCSUMIPENDI", dr["ISCSUMIPENDI"]); // ISCSUMIPENDI
				row.Add("INNORDDESC", dr["INNORDDESC"]); // INNORDDESC
				row.Add("ISCSUMGENPEN", dr["ISCSUMGENPEN"]); // ISCSUMGENPEN
				row.Add("ISCVRBASINC", dr["ISCVRBASINC"]); // ISCVRBASINC
				row.Add("ISCPORINCRE", dr["ISCPORINCRE"]); // ISCPORINCRE
				row.Add("ISCPORINCRE1", dr["ISCPORINCRE1"]); // ISCPORINCRE1
				row.Add("ISCVALINCRE", dr["ISCVALINCRE"]); // ISCVALINCRE
				row.Add("ISCVALINCRE1", dr["ISCVALINCRE1"]); // ISCVALINCRE1
				row.Add("ISCOIDORIHCRE", dr["ISCOIDORIHCRE"]); // ISCOIDORIHCRE
				row.Add("ISCTIPSOLDIS", dr["ISCTIPSOLDIS"]); // ISCTIPSOLDIS
				row.Add("INNDISFORREC", dr["INNDISFORREC"]); // INNDISFORREC
				row.Add("INNPENDICAB", dr["INNPENDICAB"]); // INNPENDICAB
				row.Add("ISCINDIDESA", dr["ISCINDIDESA"]); // ISCINDIDESA
				row.Add("ISCJUSTIFICA", dr["ISCJUSTIFICA"]); // ISCJUSTIFICA
				row.Add("ISCFECORIGEN", dr["ISCFECORIGEN"]); // ISCFECORIGEN
				row.Add("ISCGFMIDFOR", dr["ISCGFMIDFOR"]); // ISCGFMIDFOR
				row.Add("INNCPLAPRO", dr["INNCPLAPRO"]); // INNCPLAPRO
				row.Add("INNCCONFIR", dr["INNCCONFIR"]); // INNCCONFIR
				row.Add("INNCAUTCONFCOMPEN", dr["INNCAUTCONFCOMPEN"]); // INNCAUTCONFCOMPEN
				row.Add("INNCAUTANULCOMPEN", dr["INNCAUTANULCOMPEN"]); // INNCAUTANULCOMPEN
				row.Add("ISCINTERCOMPEN", dr["ISCINTERCOMPEN"]); // ISCINTERCOMPEN
				row.Add("ISCMEDREMICOMPEN", dr["ISCMEDREMICOMPEN"]); // ISCMEDREMICOMPEN
				row.Add("ISCNUMMESCOMPEN", dr["ISCNUMMESCOMPEN"]); // ISCNUMMESCOMPEN
				return GetRowHash(row);
			}

			// Add record

			#pragma warning disable 168, 219

			protected async Task<JsonBoolResult> AddRow(Dictionary<string, object> rsold = null) { // DN
				bool result = false;
				var rsnew = new Dictionary<string, object>();
				if (!Empty(OID.CurrentValue)) { // Check field with unique index
					var filter = "(OID = " + AdjustSql(OID.CurrentValue, DbId) + ")";
					using (var rschk = await LoadRs(filter)) {
						if (rschk != null && await rschk.ReadAsync()) {
							FailureMessage = Language.Phrase("DupIndex").Replace("%f", INNCSUMPA.OID.Caption).Replace("%v", Convert.ToString(INNCSUMPA.OID.CurrentValue));
							return JsonBoolResult.FalseResult;
						}
					}
				}

				// Load db values from rsold
				LoadDbValues(rsold);
				if (rsold != null) {
				}
				try {

					// OID
					OID.SetDbValue(rsnew, OID.CurrentValue, 0, false);

					// ADNINGRESO
					ADNINGRESO.SetDbValue(rsnew, ADNINGRESO.CurrentValue, System.DBNull.Value, false);

					// SLNORDSER
					SLNORDSER.SetDbValue(rsnew, SLNORDSER.CurrentValue, System.DBNull.Value, false);

					// ISCESTPRO
					ISCESTPRO.SetDbValue(rsnew, ISCESTPRO.CurrentValue, System.DBNull.Value, false);

					// GEENMedico
					GEENMedico.SetDbValue(rsnew, GEENMedico.CurrentValue, System.DBNull.Value, false);

					// INNALMACE
					INNALMACE.SetDbValue(rsnew, INNALMACE.CurrentValue, System.DBNull.Value, false);

					// GENARESER
					GENARESER.SetDbValue(rsnew, GENARESER.CurrentValue, System.DBNull.Value, false);

					// GENARESER1
					GENARESER1.SetDbValue(rsnew, GENARESER1.CurrentValue, System.DBNull.Value, false);

					// ISCSUMIORIGEN
					ISCSUMIORIGEN.SetDbValue(rsnew, ISCSUMIORIGEN.CurrentValue, System.DBNull.Value, false);

					// ISCSUMIPENDI
					ISCSUMIPENDI.SetDbValue(rsnew, ISCSUMIPENDI.CurrentValue, System.DBNull.Value, false);

					// INNORDDESC
					INNORDDESC.SetDbValue(rsnew, INNORDDESC.CurrentValue, System.DBNull.Value, false);

					// ISCSUMGENPEN
					ISCSUMGENPEN.SetDbValue(rsnew, ConvertToBool(ISCSUMGENPEN.CurrentValue, "1", "0"), System.DBNull.Value, false); // DN1204

					// ISCVRBASINC
					ISCVRBASINC.SetDbValue(rsnew, ISCVRBASINC.CurrentValue, System.DBNull.Value, false);

					// ISCPORINCRE
					ISCPORINCRE.SetDbValue(rsnew, ISCPORINCRE.CurrentValue, System.DBNull.Value, false);

					// ISCPORINCRE1
					ISCPORINCRE1.SetDbValue(rsnew, ISCPORINCRE1.CurrentValue, System.DBNull.Value, false);

					// ISCVALINCRE
					ISCVALINCRE.SetDbValue(rsnew, ISCVALINCRE.CurrentValue, System.DBNull.Value, false);

					// ISCVALINCRE1
					ISCVALINCRE1.SetDbValue(rsnew, ISCVALINCRE1.CurrentValue, System.DBNull.Value, false);

					// ISCOIDORIHCRE
					ISCOIDORIHCRE.SetDbValue(rsnew, ISCOIDORIHCRE.CurrentValue, System.DBNull.Value, false);

					// ISCTIPSOLDIS
					ISCTIPSOLDIS.SetDbValue(rsnew, ISCTIPSOLDIS.CurrentValue, System.DBNull.Value, false);

					// INNDISFORREC
					INNDISFORREC.SetDbValue(rsnew, INNDISFORREC.CurrentValue, System.DBNull.Value, false);

					// INNPENDICAB
					INNPENDICAB.SetDbValue(rsnew, INNPENDICAB.CurrentValue, System.DBNull.Value, false);

					// ISCINDIDESA
					ISCINDIDESA.SetDbValue(rsnew, ConvertToBool(ISCINDIDESA.CurrentValue, "1", "0"), System.DBNull.Value, false); // DN1204

					// ISCJUSTIFICA
					ISCJUSTIFICA.SetDbValue(rsnew, ISCJUSTIFICA.CurrentValue, System.DBNull.Value, false);

					// ISCFECORIGEN
					ISCFECORIGEN.SetDbValue(rsnew, UnformatDateTime(ISCFECORIGEN.CurrentValue, 0), System.DBNull.Value, false);

					// ISCGFMIDFOR
					ISCGFMIDFOR.SetDbValue(rsnew, ISCGFMIDFOR.CurrentValue, System.DBNull.Value, false);

					// INNCPLAPRO
					INNCPLAPRO.SetDbValue(rsnew, INNCPLAPRO.CurrentValue, System.DBNull.Value, false);

					// INNCCONFIR
					INNCCONFIR.SetDbValue(rsnew, ConvertToBool(INNCCONFIR.CurrentValue, "1", "0"), System.DBNull.Value, false); // DN1204

					// INNCAUTCONFCOMPEN
					INNCAUTCONFCOMPEN.SetDbValue(rsnew, INNCAUTCONFCOMPEN.CurrentValue, System.DBNull.Value, false);

					// INNCAUTANULCOMPEN
					INNCAUTANULCOMPEN.SetDbValue(rsnew, INNCAUTANULCOMPEN.CurrentValue, System.DBNull.Value, false);

					// ISCINTERCOMPEN
					ISCINTERCOMPEN.SetDbValue(rsnew, ConvertToBool(ISCINTERCOMPEN.CurrentValue, "1", "0"), System.DBNull.Value, false); // DN1204

					// ISCMEDREMICOMPEN
					ISCMEDREMICOMPEN.SetDbValue(rsnew, ISCMEDREMICOMPEN.CurrentValue, System.DBNull.Value, false);

					// ISCNUMMESCOMPEN
					ISCNUMMESCOMPEN.SetDbValue(rsnew, ISCNUMMESCOMPEN.CurrentValue, System.DBNull.Value, false);
				} catch (Exception e) {
					if (Config.Debug)
						throw;
					FailureMessage = e.Message;
					return JsonBoolResult.FalseResult;
				}

				// Call Row Inserting event
				bool insertRow = Row_Inserting(rsold, rsnew);

				// Check if key value entered
				if (insertRow && ValidateKey && Empty(rsnew["OID"])) {
					FailureMessage = Language.Phrase("InvalidKeyValue");
					insertRow = false;
				}

				// Check for duplicate key
				if (insertRow && ValidateKey) {
					string filter = GetRecordFilter();
					using (var rschk = await LoadRs(filter)) {
						if (rschk != null && await rschk.ReadAsync()) {
							FailureMessage = Language.Phrase("DupKey").Replace("%f", filter);
							insertRow = false;
						}
					}
				}
				if (insertRow) {
					try {
						await InsertAsync(rsnew);
						result = true;
					} catch (Exception e) {
						if (Config.Debug)
							throw;
						FailureMessage = e.Message;
						result = false;
					}
				} else {
					if (SuccessMessage != "" || FailureMessage != "") {

						// Use the message, do nothing
					} else if (CancelMessage != "") {
						FailureMessage = CancelMessage;
						CancelMessage = "";
					} else {
						FailureMessage = Language.Phrase("InsertCancelled");
					}
					result = false;
				}

				// Call Row Inserted event
				if (result)
					Row_Inserted(rsold, rsnew);

				// Write JSON for API request
				var d = new Dictionary<string, object>();
				d.Add("success", result);
				if (IsApi() && result) {
					var row = GetRecordFromDictionary(rsnew);
					d.Add(TableVar, row);
					d.Add("version", Config.ProductVersion);
					return new JsonBoolResult(d, result);
				}
				return new JsonBoolResult(d, result);
			}

			// Set up Breadcrumb
			protected void SetupBreadcrumb() {
				var breadcrumb = new Breadcrumb();
				string url = CurrentUrl();
				url = Regex.Replace(url, @"\?cmd=reset(all)?$", ""); // Remove cmd=reset / cmd=resetall
				breadcrumb.Add("list", TableVar, url, "", TableVar, true);
				CurrentBreadcrumb = breadcrumb;
			}

			// Setup lookup options
			public async Task SetupLookupOptions(DbField fld)
			{
				Func<string> lookupFilter = null;
				if (!Empty(fld.Lookup) && fld.Lookup.Options.Count == 0) {

					// Set up lookup SQL
					switch (fld.FieldVar) {
						default:
							break;
					}

					// Always call to Lookup.GetSql so that user can setup Lookup.Options in Lookup_Selecting server event
					var sql = fld.Lookup.GetSql(false, "", lookupFilter, this);

					// Set up lookup cache
					if (fld.UseLookupCache && !Empty(sql) && fld.Lookup.Options.Count == 0) {
						int totalCnt = await TryGetRecordCount(sql);
						if (totalCnt > fld.LookupCacheCount) // Total count > cache count, do not cache
							return;
						var ar = new Dictionary<string, Dictionary<string, object>>();
						var values = new List<object>();
						var conn = GetConnection();
						List<Dictionary<string, object>> rs = await conn.GetRowsAsync(sql);
						if (rs != null) {
							foreach (var row in rs) {
								if (!ar.ContainsKey(row.Values.First().ToString()))
									ar.Add(row.Values.First().ToString(), row);
							}
						}
						fld.Lookup.Options = ar;
					}
				}
			}

			// Close recordset
			public void CloseRecordset() {
				using (Recordset) {} // Dispose
			}

			// Page Load event
			public virtual void Page_Load() {

				//Log("Page Load");
			}

			// Page Unload event
			public virtual void Page_Unload() {

				//Log("Page Unload");
			}

			// Page Redirecting event
			public virtual void Page_Redirecting(ref string url) {

				//url = newurl;
			}

			// Message Showing event
			// type = ""|"success"|"failure"|"warning"

			public virtual void Message_Showing(ref string msg, string type) {

				// Note: Do not change msg outside the following 4 cases.
				if (type == "success") {

					//msg = "your success message";
				} else if (type == "failure") {

					//msg = "your failure message";
				} else if (type == "warning") {

					//msg = "your warning message";
				} else {

					//msg = "your message";
				}
			}

			// Page Load event
			public virtual void Page_Render() {

				//Log("Page Render");
			}

			// Page Data Rendering event
			public virtual void Page_DataRendering(ref string header) {

				// Example:
				//header = "your header";

			}

			// Page Data Rendered event
			public virtual void Page_DataRendered(ref string footer) {

				// Example:
				//footer = "your footer";

			}

			// Form Custom Validate event
			public virtual bool Form_CustomValidate(ref string customError) {

				//Return error message in customError
				return true;
			}

			// ListOptions Load event
			public virtual void ListOptions_Load() {

				// Example:
				//var opt = ListOptions.Add("new");
				//opt.Header = "xxx";
				//opt.OnLeft = true; // Link on left
				//opt.MoveTo(0); // Move to first column

			}

			// ListOptions Rendering event
			public virtual void ListOptions_Rendering() {

				//xxxGrid.DetailAdd = (...condition...); // Set to true or false conditionally
				//xxxGrid.DetailEdit = (...condition...); // Set to true or false conditionally
				//xxxGrid.DetailView = (...condition...); // Set to true or false conditionally

			}

			// ListOptions Rendered event
			public virtual void ListOptions_Rendered() {

				//Example:
				//ListOptions["new"].Body = "xxx";

			}

			// Row Custom Action event
			public virtual bool Row_CustomAction(string action, Dictionary<string, object> row) {

				// Return false to abort
				return true;
			}

			// Grid Inserting event
			public virtual bool Grid_Inserting() {

				// Enter your code here
				// To reject grid insert, set return value to FALSE

				return true;
			}

			// Grid Inserted event
			public virtual void Grid_Inserted(List<Dictionary<string, object>> rsnew) {

				//Log("Grid Inserted");
			}

			// Grid Updating event
			public virtual bool Grid_Updating(List<Dictionary<string, object>> rsold) {

				// Enter your code here
				// To reject grid update, set return value to FALSE

				return true;
			}

			// Grid Updated event
			public virtual void Grid_Updated(List<Dictionary<string, object>> rsold, List<Dictionary<string, object>> rsnew) {

				//Log("Grid Updated");
			}
		}
	}
}
