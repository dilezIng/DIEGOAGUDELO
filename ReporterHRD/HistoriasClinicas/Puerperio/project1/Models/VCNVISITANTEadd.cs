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
		/// VCNVISITANTE_Add
		/// </summary>

		public static _VCNVISITANTE_Add VCNVISITANTE_Add {
			get => HttpData.Get<_VCNVISITANTE_Add>("VCNVISITANTE_Add");
			set => HttpData["VCNVISITANTE_Add"] = value;
		}

		/// <summary>
		/// Page class for VCNVISITANTE
		/// </summary>

		public class _VCNVISITANTE_Add : _VCNVISITANTE_AddBase
		{

			// Construtor
			public _VCNVISITANTE_Add(Controller controller = null) : base(controller) {
			}
		}

		/// <summary>
		/// Page base class
		/// </summary>

		public class _VCNVISITANTE_AddBase : _VCNVISITANTE, IAspNetMakerPage
		{

			// Page ID
			public string PageID = "add";

			// Project ID
			public string ProjectID = "{3DC5054A-CA8A-4B9E-84E7-55994334EA5F}";

			// Table name
			public string TableName = "VCNVISITANTE";

			// Page object name
			public string PageObjName = "VCNVISITANTE_Add";

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
			public _VCNVISITANTE_AddBase(Controller controller = null) { // DN
				if (controller != null)
					Controller = controller;

				// Initialize
				CurrentPage = this;

				// Language object
				Language = Language ?? new Lang();

				// Table object (VCNVISITANTE)
				if (VCNVISITANTE == null || VCNVISITANTE is _VCNVISITANTE)
					VCNVISITANTE = this;

				// Start time
				StartTime = Environment.TickCount;

				// Debug message
				LoadDebugMessage();

				// Open connection
				Conn = Connection; // DN
			}

			#pragma warning disable 1998

			// Export view result
			public async Task<IActionResult> ExportView() { // DN
				if (!Empty(CustomExport) && CustomExport == Export && Config.Export.TryGetValue(CustomExport, out string classname)) {
					IActionResult result = null;
					string content = await GetViewOutput();
					if (Empty(ExportFileName))
						ExportFileName = TableVar;
					dynamic doc = CreateInstance(classname, new object[] { VCNVISITANTE, "" }); // DN
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

						// Handle modal response
						if (IsModal) { // Show as modal
							var row = new Dictionary<string, string> { {"url", GetUrl(url)}, {"modal", "1"} };
							string pageName = GetPageName(url);
							if (pageName != ListUrl) { // Not List page
								row.Add("caption", GetModalCaption(pageName));
								if (pageName == "VCNVISITANTEview")
									row.Add("view", "1");
							} else { // List page should not be shown as modal => error
								row.Add("error", FailureMessage);
								ClearFailureMessage();
							}
							return Controller.Json(row);
						} else {
							SaveDebugMessage();
							return Controller.LocalRedirect(AppPath(url));
						}
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
				if (IsAdd || IsCopy || IsGridAdd)
					OID.Visible = false;
			}

			// Properties
			public string FormClassName = "ew-horizontal ew-form ew-add-form";
			public bool IsModal = false;
			public bool IsMobileOrModal = false;
			public string DbMasterFilter = "";
			public string DbDetailFilter = "";
			public int StartRecord;
			public DbDataReader OldRecordset = null;
			public DbDataReader Recordset = null; // Reserved // DN
			public bool CopyRecord;

			/// <summary>
			/// Page run
			/// </summary>
			/// <returns>Page result</returns>

			public async Task<IActionResult> Run() {

				// Header
				Header(Config.Cache);

				// Is modal
				IsModal = Param<bool>("modal");

				// Create form object
				CurrentForm = new HttpForm();
				CurrentAction = Param("action"); // Set up current action
				OID.Visible = false;
				VTEDOCUMENTO.SetVisibility();
				VTETIPODOCUM.SetVisibility();
				VTEPRINOM.SetVisibility();
				VTESEGNOM.SetVisibility();
				VTEPRIAPE.SetVisibility();
				VTESEGAPE.SetVisibility();
				VTEGENERO.SetVisibility();
				VTEFOTO.SetVisibility();
				OptimisticLockField.SetVisibility();
				HideFieldsForAddEdit();

				// Do not use lookup cache
				SetUseLookupCache(false);

				// Global Page Loading event
				Page_Loading();

				// Page Load event
				Page_Load();

				// Check token
				if (!await ValidPost())
					End(Language.Phrase("InvalidPostRequest"));

				// Create token
				CreateToken();

				// Set up lookup cache
				// Check modal

				if (IsModal)
					SkipHeaderFooter = true;
				IsMobileOrModal = IsMobile() || IsModal;
				FormClassName = "ew-form ew-add-form ew-horizontal";
				bool postBack = false;

				// Set up current action
				if (IsApi()) {
					CurrentAction = "insert"; // Add record directly
					postBack = true;
				} else if (!Empty(Post("action"))) {
					CurrentAction = Post("action"); // Get form action
					postBack = true;
				} else { // Not post back

					// Load key from QueryString
					CopyRecord = true;
					string[] keyValues = null;
					object rv;
					if (IsApi() && RouteValues.TryGetValue("key", out object k))
						keyValues = k.ToString().Split('/');
					if (RouteValues.TryGetValue("OID", out rv)) { // DN
						OID.QueryValue = Convert.ToString(rv);
						SetKey("OID", OID.CurrentValue); // Set up key
					} else if (!Empty(Get("OID"))) {
						OID.QueryValue = Get("OID");
						SetKey("OID", OID.CurrentValue); // Set up key
					} else if (IsApi() && !Empty(keyValues)) {
						OID.QueryValue = Convert.ToString(keyValues[0]);
						SetKey("OID", OID.CurrentValue); // Set up key
					} else {
						SetKey("OID", ""); // Clear key
						CopyRecord = false;
					}
					if (CopyRecord) {
						CurrentAction = "copy"; // Copy record
					} else {
						CurrentAction = "show"; // Display blank record
					}
				}

				// Load old record / default values
				bool loaded = await LoadOldRecord();

				// Load form values
				if (postBack) {
					await LoadFormValues(); // Load form values
				}

				// Validate form if post back
				if (postBack) {
					if (!await ValidateForm()) {
						EventCancelled = true; // Event cancelled
						RestoreFormValues(); // Restore form values
						FailureMessage = FormError;
						if (IsApi())
							return Terminate();
						else
							CurrentAction = "show"; // Form error, reset action
					}
				}

				// Perform current action
				switch (CurrentAction) {
					case "copy": // Copy an existing record
						using (OldRecordset) {} // Dispose
						if (!loaded) { // Record not loaded
							if (Empty(FailureMessage))
								FailureMessage = Language.Phrase("NoRecord"); // No record found
							return Terminate("VCNVISITANTElist"); // No matching record, return to List page // DN
						}
						break;
					case "insert": // Add new record // DN
						SendEmail = true; // Send email on add success
						var rsold = Connection.GetRow(OldRecordset);
						using (OldRecordset) {} // Dispose
						var res = await AddRow(rsold);
						if (res) { // Add successful
							if (Empty(SuccessMessage))
								SuccessMessage = Language.Phrase("AddSuccess"); // Set up success message
							string returnUrl = "";
							returnUrl = ReturnUrl;
							if (GetPageName(returnUrl) == "VCNVISITANTElist")
								returnUrl = AddMasterUrl(ListUrl); // List page, return to List page with correct master key if necessary
							else if (GetPageName(returnUrl) == "VCNVISITANTEview")
								returnUrl = ViewUrl; // View page, return to View page with key URL directly
							if (IsApi()) // Return to caller
								return res;
							else
								return Terminate(returnUrl);
						} else if (IsApi()) { // API request, return
							return Terminate();
						} else {
							EventCancelled = true; // Event cancelled
							RestoreFormValues(); // Add failed, restore form values
						}
						break;
				}

				// Set up Breadcrumb
				SetupBreadcrumb();

				// Render row based on row type
				RowType = Config.RowTypeAdd; // Render add type

				// Render row
				ResetAttributes();
				await RenderRow();
				return PageResult();
			}

			// Confirm page
			public bool ConfirmPage = false; // DN

			#pragma warning disable 1998

			// Get upload files
			public async Task GetUploadFiles()
			{

				// Get upload data
				VTEFOTO.Upload.Index = CurrentForm.Index;
				if (!await VTEFOTO.Upload.UploadFile()) // DN
					End(VCNVISITANTE.VTEFOTO.Upload.Message);
			}

			#pragma warning restore 1998

			// Load default values
			protected void LoadDefaultValues() {
				OID.CurrentValue = System.DBNull.Value;
				OID.OldValue = OID.CurrentValue;
				VTEDOCUMENTO.CurrentValue = System.DBNull.Value;
				VTEDOCUMENTO.OldValue = VTEDOCUMENTO.CurrentValue;
				VTETIPODOCUM.CurrentValue = System.DBNull.Value;
				VTETIPODOCUM.OldValue = VTETIPODOCUM.CurrentValue;
				VTEPRINOM.CurrentValue = System.DBNull.Value;
				VTEPRINOM.OldValue = VTEPRINOM.CurrentValue;
				VTESEGNOM.CurrentValue = System.DBNull.Value;
				VTESEGNOM.OldValue = VTESEGNOM.CurrentValue;
				VTEPRIAPE.CurrentValue = System.DBNull.Value;
				VTEPRIAPE.OldValue = VTEPRIAPE.CurrentValue;
				VTESEGAPE.CurrentValue = System.DBNull.Value;
				VTESEGAPE.OldValue = VTESEGAPE.CurrentValue;
				VTEGENERO.CurrentValue = System.DBNull.Value;
				VTEGENERO.OldValue = VTEGENERO.CurrentValue;
				VTEFOTO.Upload.DbValue = System.DBNull.Value;
				VTEFOTO.OldValue = VTEFOTO.Upload.DbValue;
				OptimisticLockField.CurrentValue = System.DBNull.Value;
				OptimisticLockField.OldValue = OptimisticLockField.CurrentValue;
			}

			#pragma warning disable 1998

			// Load form values
			protected async Task LoadFormValues() {
				await GetUploadFiles(); // Get upload files
				string val;

				// Check field name 'VTEDOCUMENTO' first before field var 'x_VTEDOCUMENTO'
				val = CurrentForm.GetValue("VTEDOCUMENTO", "x_VTEDOCUMENTO");
				if (!VTEDOCUMENTO.IsDetailKey) {
					if (IsApi() && val == null)
						VTEDOCUMENTO.Visible = false; // Disable update for API request
					else
						VTEDOCUMENTO.FormValue = val;
				}

				// Check field name 'VTETIPODOCUM' first before field var 'x_VTETIPODOCUM'
				val = CurrentForm.GetValue("VTETIPODOCUM", "x_VTETIPODOCUM");
				if (!VTETIPODOCUM.IsDetailKey) {
					if (IsApi() && val == null)
						VTETIPODOCUM.Visible = false; // Disable update for API request
					else
						VTETIPODOCUM.FormValue = val;
				}

				// Check field name 'VTEPRINOM' first before field var 'x_VTEPRINOM'
				val = CurrentForm.GetValue("VTEPRINOM", "x_VTEPRINOM");
				if (!VTEPRINOM.IsDetailKey) {
					if (IsApi() && val == null)
						VTEPRINOM.Visible = false; // Disable update for API request
					else
						VTEPRINOM.FormValue = val;
				}

				// Check field name 'VTESEGNOM' first before field var 'x_VTESEGNOM'
				val = CurrentForm.GetValue("VTESEGNOM", "x_VTESEGNOM");
				if (!VTESEGNOM.IsDetailKey) {
					if (IsApi() && val == null)
						VTESEGNOM.Visible = false; // Disable update for API request
					else
						VTESEGNOM.FormValue = val;
				}

				// Check field name 'VTEPRIAPE' first before field var 'x_VTEPRIAPE'
				val = CurrentForm.GetValue("VTEPRIAPE", "x_VTEPRIAPE");
				if (!VTEPRIAPE.IsDetailKey) {
					if (IsApi() && val == null)
						VTEPRIAPE.Visible = false; // Disable update for API request
					else
						VTEPRIAPE.FormValue = val;
				}

				// Check field name 'VTESEGAPE' first before field var 'x_VTESEGAPE'
				val = CurrentForm.GetValue("VTESEGAPE", "x_VTESEGAPE");
				if (!VTESEGAPE.IsDetailKey) {
					if (IsApi() && val == null)
						VTESEGAPE.Visible = false; // Disable update for API request
					else
						VTESEGAPE.FormValue = val;
				}

				// Check field name 'VTEGENERO' first before field var 'x_VTEGENERO'
				val = CurrentForm.GetValue("VTEGENERO", "x_VTEGENERO");
				if (!VTEGENERO.IsDetailKey) {
					if (IsApi() && val == null)
						VTEGENERO.Visible = false; // Disable update for API request
					else
						VTEGENERO.FormValue = val;
				}

				// Check field name 'OptimisticLockField' first before field var 'x_OptimisticLockField'
				val = CurrentForm.GetValue("OptimisticLockField", "x_OptimisticLockField");
				if (!OptimisticLockField.IsDetailKey) {
					if (IsApi() && val == null)
						OptimisticLockField.Visible = false; // Disable update for API request
					else
						OptimisticLockField.FormValue = val;
				}

				// Check field name 'OID' first before field var 'x_OID'
				val = CurrentForm.GetValue("OID", "x_OID");
			}

			#pragma warning restore 1998

			// Restore form values
			public void RestoreFormValues() {
				VTEDOCUMENTO.CurrentValue = VTEDOCUMENTO.FormValue;
				VTETIPODOCUM.CurrentValue = VTETIPODOCUM.FormValue;
				VTEPRINOM.CurrentValue = VTEPRINOM.FormValue;
				VTESEGNOM.CurrentValue = VTESEGNOM.FormValue;
				VTEPRIAPE.CurrentValue = VTEPRIAPE.FormValue;
				VTESEGAPE.CurrentValue = VTESEGAPE.FormValue;
				VTEGENERO.CurrentValue = VTEGENERO.FormValue;
				OptimisticLockField.CurrentValue = OptimisticLockField.FormValue;
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
				VTEDOCUMENTO.SetDbValue(row["VTEDOCUMENTO"]);
				VTETIPODOCUM.SetDbValue(row["VTETIPODOCUM"]);
				VTEPRINOM.SetDbValue(row["VTEPRINOM"]);
				VTESEGNOM.SetDbValue(row["VTESEGNOM"]);
				VTEPRIAPE.SetDbValue(row["VTEPRIAPE"]);
				VTESEGAPE.SetDbValue(row["VTESEGAPE"]);
				VTEGENERO.SetDbValue(row["VTEGENERO"]);
				VTEFOTO.Upload.DbValue = row["VTEFOTO"];
				OptimisticLockField.SetDbValue(row["OptimisticLockField"]);
			}

			#pragma warning restore 162, 168, 1998

			// Return a row with default values
			protected Dictionary<string, object> NewRow() {
				LoadDefaultValues();
				var row = new Dictionary<string, object>();
				row.Add("OID", OID.CurrentValue);
				row.Add("VTEDOCUMENTO", VTEDOCUMENTO.CurrentValue);
				row.Add("VTETIPODOCUM", VTETIPODOCUM.CurrentValue);
				row.Add("VTEPRINOM", VTEPRINOM.CurrentValue);
				row.Add("VTESEGNOM", VTESEGNOM.CurrentValue);
				row.Add("VTEPRIAPE", VTEPRIAPE.CurrentValue);
				row.Add("VTESEGAPE", VTESEGAPE.CurrentValue);
				row.Add("VTEGENERO", VTEGENERO.CurrentValue);
				row.Add("VTEFOTO", VTEFOTO.Upload.DbValue);
				row.Add("OptimisticLockField", OptimisticLockField.CurrentValue);
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

				// Call Row_Rendering event
				Row_Rendering();

				// Common render codes for all row types
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

				if (RowType == Config.RowTypeView) { // View row

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
				} else if (RowType == Config.RowTypeAdd) { // Add row

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
					if ((IsShow || IsCopy) && !EventCancelled)
						await RenderUploadField(VTEFOTO);

					// OptimisticLockField
					OptimisticLockField.EditAttrs["class"] = "form-control";
					OptimisticLockField.EditValue = OptimisticLockField.CurrentValue; // DN
					OptimisticLockField.PlaceHolder = RemoveHtml(OptimisticLockField.Caption);

					// Add refer script
					// VTEDOCUMENTO

					VTEDOCUMENTO.HrefValue = "";

					// VTETIPODOCUM
					VTETIPODOCUM.HrefValue = "";

					// VTEPRINOM
					VTEPRINOM.HrefValue = "";

					// VTESEGNOM
					VTESEGNOM.HrefValue = "";

					// VTEPRIAPE
					VTEPRIAPE.HrefValue = "";

					// VTESEGAPE
					VTESEGAPE.HrefValue = "";

					// VTEGENERO
					VTEGENERO.HrefValue = "";

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

					// OptimisticLockField
					OptimisticLockField.HrefValue = "";
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
					if (!OID.IsDetailKey && Empty(OID.FormValue))
						FormError = AddMessage(FormError, OID.RequiredErrorMessage.Replace("%s", OID.Caption));
				}
				if (VTEDOCUMENTO.Required) {
					if (!VTEDOCUMENTO.IsDetailKey && Empty(VTEDOCUMENTO.FormValue))
						FormError = AddMessage(FormError, VTEDOCUMENTO.RequiredErrorMessage.Replace("%s", VTEDOCUMENTO.Caption));
				}
				if (VTETIPODOCUM.Required) {
					if (!VTETIPODOCUM.IsDetailKey && Empty(VTETIPODOCUM.FormValue))
						FormError = AddMessage(FormError, VTETIPODOCUM.RequiredErrorMessage.Replace("%s", VTETIPODOCUM.Caption));
				}
				if (!CheckInteger(VTETIPODOCUM.FormValue))
					FormError = AddMessage(FormError, VTETIPODOCUM.ErrorMessage);
				if (VTEPRINOM.Required) {
					if (!VTEPRINOM.IsDetailKey && Empty(VTEPRINOM.FormValue))
						FormError = AddMessage(FormError, VTEPRINOM.RequiredErrorMessage.Replace("%s", VTEPRINOM.Caption));
				}
				if (VTESEGNOM.Required) {
					if (!VTESEGNOM.IsDetailKey && Empty(VTESEGNOM.FormValue))
						FormError = AddMessage(FormError, VTESEGNOM.RequiredErrorMessage.Replace("%s", VTESEGNOM.Caption));
				}
				if (VTEPRIAPE.Required) {
					if (!VTEPRIAPE.IsDetailKey && Empty(VTEPRIAPE.FormValue))
						FormError = AddMessage(FormError, VTEPRIAPE.RequiredErrorMessage.Replace("%s", VTEPRIAPE.Caption));
				}
				if (VTESEGAPE.Required) {
					if (!VTESEGAPE.IsDetailKey && Empty(VTESEGAPE.FormValue))
						FormError = AddMessage(FormError, VTESEGAPE.RequiredErrorMessage.Replace("%s", VTESEGAPE.Caption));
				}
				if (VTEGENERO.Required) {
					if (!VTEGENERO.IsDetailKey && Empty(VTEGENERO.FormValue))
						FormError = AddMessage(FormError, VTEGENERO.RequiredErrorMessage.Replace("%s", VTEGENERO.Caption));
				}
				if (!CheckInteger(VTEGENERO.FormValue))
					FormError = AddMessage(FormError, VTEGENERO.ErrorMessage);
				if (VTEFOTO.Required) {
					if (VTEFOTO.Upload.FileName == "" && !VTEFOTO.Upload.KeepFile)
						FormError = AddMessage(FormError, VTEFOTO.RequiredErrorMessage.Replace("%s", VTEFOTO.Caption));
				}
				if (OptimisticLockField.Required) {
					if (!OptimisticLockField.IsDetailKey && Empty(OptimisticLockField.FormValue))
						FormError = AddMessage(FormError, OptimisticLockField.RequiredErrorMessage.Replace("%s", OptimisticLockField.Caption));
				}
				if (!CheckInteger(OptimisticLockField.FormValue))
					FormError = AddMessage(FormError, OptimisticLockField.ErrorMessage);

				// Return validate result
				bool valid = Empty(FormError);

				// Call Form_CustomValidate event
				string formCustomError = "";
				valid = valid && Form_CustomValidate(ref formCustomError);
				FormError = AddMessage(FormError, formCustomError);
				return valid;
			}

			#pragma warning restore 1998

			// Save data to memory cache
			public void SetCache<T>(string key, T value, int span) => Cache.Set<T>(key, value, new MemoryCacheEntryOptions()
				.SetSlidingExpiration(TimeSpan.FromMilliseconds(span))); // Keep in cache for this time, reset time if accessed

			// Gete data from memory cache
			public void GetCache<T>(string key) => Cache.Get<T>(key);

			// Add record

			#pragma warning disable 168, 219

			protected async Task<JsonBoolResult> AddRow(Dictionary<string, object> rsold = null) { // DN
				bool result = false;
				var rsnew = new Dictionary<string, object>();

				// Load db values from rsold
				LoadDbValues(rsold);
				if (rsold != null) {
				}
				try {

					// VTEDOCUMENTO
					VTEDOCUMENTO.SetDbValue(rsnew, VTEDOCUMENTO.CurrentValue, System.DBNull.Value, false);

					// VTETIPODOCUM
					VTETIPODOCUM.SetDbValue(rsnew, VTETIPODOCUM.CurrentValue, System.DBNull.Value, false);

					// VTEPRINOM
					VTEPRINOM.SetDbValue(rsnew, VTEPRINOM.CurrentValue, System.DBNull.Value, false);

					// VTESEGNOM
					VTESEGNOM.SetDbValue(rsnew, VTESEGNOM.CurrentValue, System.DBNull.Value, false);

					// VTEPRIAPE
					VTEPRIAPE.SetDbValue(rsnew, VTEPRIAPE.CurrentValue, System.DBNull.Value, false);

					// VTESEGAPE
					VTESEGAPE.SetDbValue(rsnew, VTESEGAPE.CurrentValue, System.DBNull.Value, false);

					// VTEGENERO
					VTEGENERO.SetDbValue(rsnew, VTEGENERO.CurrentValue, System.DBNull.Value, false);

					// VTEFOTO
					if (!VTEFOTO.Upload.KeepFile) {
						if (IsDBNull(VTEFOTO.Upload.Value)) {
							rsnew["VTEFOTO"] = System.DBNull.Value;
						} else {
							rsnew["VTEFOTO"] = VTEFOTO.Upload.Value;
						}
					}

					// OptimisticLockField
					OptimisticLockField.SetDbValue(rsnew, OptimisticLockField.CurrentValue, System.DBNull.Value, false);
				} catch (Exception e) {
					if (Config.Debug)
						throw;
					FailureMessage = e.Message;
					return JsonBoolResult.FalseResult;
				}

				// Call Row Inserting event
				bool insertRow = Row_Inserting(rsold, rsnew);
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

				// VTEFOTO
				if (!Empty(VTEFOTO.Upload.FileToken))
					CleanUploadTempPath(VTEFOTO.Upload.FileToken);
				else
					CleanUploadTempPath(VTEFOTO, VTEFOTO.Upload.Index);

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
				breadcrumb.Add("list", TableVar, AppPath(AddMasterUrl("VCNVISITANTElist")), "", TableVar, true);
				string pageId = IsCopy ? "Copy" : "Add";
				breadcrumb.Add("add", pageId, url);
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
		}
	}
}
