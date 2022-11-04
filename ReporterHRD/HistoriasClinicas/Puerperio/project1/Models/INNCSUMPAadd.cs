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
		/// INNCSUMPA_Add
		/// </summary>

		public static _INNCSUMPA_Add INNCSUMPA_Add {
			get => HttpData.Get<_INNCSUMPA_Add>("INNCSUMPA_Add");
			set => HttpData["INNCSUMPA_Add"] = value;
		}

		/// <summary>
		/// Page class for INNCSUMPA
		/// </summary>

		public class _INNCSUMPA_Add : _INNCSUMPA_AddBase
		{

			// Construtor
			public _INNCSUMPA_Add(Controller controller = null) : base(controller) {
			}
		}

		/// <summary>
		/// Page base class
		/// </summary>

		public class _INNCSUMPA_AddBase : _INNCSUMPA, IAspNetMakerPage
		{

			// Page ID
			public string PageID = "add";

			// Project ID
			public string ProjectID = "{3DC5054A-CA8A-4B9E-84E7-55994334EA5F}";

			// Table name
			public string TableName = "INNCSUMPA";

			// Page object name
			public string PageObjName = "INNCSUMPA_Add";

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
			public _INNCSUMPA_AddBase(Controller controller = null) { // DN
				if (controller != null)
					Controller = controller;

				// Initialize
				CurrentPage = this;

				// Language object
				Language = Language ?? new Lang();

				// Table object (INNCSUMPA)
				if (INNCSUMPA == null || INNCSUMPA is _INNCSUMPA)
					INNCSUMPA = this;

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

						// Handle modal response
						if (IsModal) { // Show as modal
							var row = new Dictionary<string, string> { {"url", GetUrl(url)}, {"modal", "1"} };
							string pageName = GetPageName(url);
							if (pageName != ListUrl) { // Not List page
								row.Add("caption", GetModalCaption(pageName));
								if (pageName == "INNCSUMPAview")
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
				OID.SetVisibility();
				ADNINGRESO.SetVisibility();
				SLNORDSER.SetVisibility();
				ISCESTPRO.SetVisibility();
				GEENMedico.SetVisibility();
				INNALMACE.SetVisibility();
				GENARESER.SetVisibility();
				ISCDETALL.SetVisibility();
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
							return Terminate("INNCSUMPAlist"); // No matching record, return to List page // DN
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
							if (GetPageName(returnUrl) == "INNCSUMPAlist")
								returnUrl = AddMasterUrl(ListUrl); // List page, return to List page with correct master key if necessary
							else if (GetPageName(returnUrl) == "INNCSUMPAview")
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
			}

			#pragma warning restore 1998

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

				// Check field name 'ISCDETALL' first before field var 'x_ISCDETALL'
				val = CurrentForm.GetValue("ISCDETALL", "x_ISCDETALL");
				if (!ISCDETALL.IsDetailKey) {
					if (IsApi() && val == null)
						ISCDETALL.Visible = false; // Disable update for API request
					else
						ISCDETALL.FormValue = val;
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
				ISCDETALL.CurrentValue = ISCDETALL.FormValue;
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

					// ISCDETALL
					ISCDETALL.ViewValue = ISCDETALL.CurrentValue;

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

					// ISCDETALL
					ISCDETALL.HrefValue = "";
					ISCDETALL.TooltipValue = "";

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

					// ISCDETALL
					ISCDETALL.EditAttrs["class"] = "form-control";
					ISCDETALL.EditValue = ISCDETALL.CurrentValue; // DN
					ISCDETALL.PlaceHolder = RemoveHtml(ISCDETALL.Caption);

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

					// ISCDETALL
					ISCDETALL.HrefValue = "";

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

					// ISCDETALL
					ISCDETALL.SetDbValue(rsnew, ISCDETALL.CurrentValue, System.DBNull.Value, false);

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
				breadcrumb.Add("list", TableVar, AppPath(AddMasterUrl("INNCSUMPAlist")), "", TableVar, true);
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
