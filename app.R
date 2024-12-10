library(shiny)

# Define UI
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      /* Introduction Page Styling */
      .intro-page {
        background: url('Quant_Group 5_FinHome.png') no-repeat center center fixed;
        background-size: cover;
        height: 100vh;
        color: white;
        text-align: right;
      }
      .start-btn {
        background-color: yellow; 
        color: black;
        font-size: 30px;
        font-weight: bold;
        border: none;
        padding: 20px 40px;
        border-radius: 10px;
        cursor: pointer;
        position: absolute;
        bottom: 45%;
        right: 15%;
      }
      .start-btn:hover {
        background-color: gold;
      }
      
      /* Menu Page Styling */
      .menu-page {
        background: url('Quant_Group 5_FinHome (1).png') no-repeat center center fixed;
        background-size: cover;
        height: 100vh;
        position: relative;
      }
      .invisible-btn {
        position: absolute;
        background-color: transparent;
        border: none;
        cursor: pointer;
      }
      .btn-house {
        top: 57%;
        left: 22%;
        width: 29.2%;
        height: 9%;
      }
      .btn-financial {
        top: 57%;
        left: 52.9%;
        width: 31.2%;
        height: 9%;
      }
      .btn-mortgage {
        top: 72.3%;
        left: 22%;
        width: 29.2%;
        height: 9%;
      }
      .btn-info {
        top: 72.3%;
        left: 52.9%;
        width: 31.2%;
        height: 9%;
      }
      
      /* House Price Prediction Page */
      .prediction-page {
        background: url('Quant_Group 5_FinHome (3).png') no-repeat center center fixed;
        background-size: cover;
        height: 100vh;
        padding: 20px;
      }
      .prediction-title {
        text-align: center;
        font-size: 60px;
        font-weight: bold;
        color: white;
        margin-bottom: 20px;
        position: relative;
        top: 2%; 
      }
      .prediction-form-group {
        margin-bottom: 10px;
      }
      .prediction-form-control {
        width: 100%;
        padding: 10px;
        font-size: 20px;
        margin-top: 10px;  
        margin-bottom: 5px; 
      }
      .prediction-input-label {
        font-size: 24px !important;  
        font-weight: bold !important;
        margin-bottom: 5px;  
        margin-top: 75px; 
      }
      .predict-btn {
        background-color: #007bff;
        color: white;
        font-size: 25px;
        font-weight: bold;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        position: absolute; 
        left: 34.5%; 
        top: 85%; 
      }
      .predict-btn:hover {
        background-color: #0056b3;
      }
      .prediction-output-price {
        margin-top: 50px;
        font-size: 30px;
        font-weight: bold;
        color: #28a745;
        text-align: right; 
        position: absolute;
        right: 2%;
        top: 45%;
      }

      /* Mortgage Calculator Page */
      .mortgage-page {
        background: url('Quant_Group 5_FinHome (3).png') no-repeat center center fixed;
        background-size: cover;
        height: 100vh;
        padding: 20px;
      }
      .mortgage-title {
        font-size: 50px;
        font-weight: bold;
        color: white;
        text-align: center;
        margin-bottom: 30px;
      }
      .mortgage-form-group {
        margin-bottom: 10px;
      }
      .mortgage-form-control {
        width: 100%;
        padding: 10px;
        font-size: 20px;
        margin-top: 10px;  
        margin-bottom: 5px; 
      }
      .mortgage-input-label {
        font-size: 24px !important;  
        font-weight: bold !important;
        margin-bottom: 5px;  
        margin-top: 75px; 
      }
      .mortgage-shiny-input-container {
        margin-bottom: 15px;
      }
      .mortgage-calculate-btn {
        background-color: #007bff;
        color: white;
        font-size: 20px;
        font-weight: bold;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      .mortgage-calculate-btn:hover {
        background-color: #0056b3;
      }
      .mortgage-result {
        margin-top: 50px;
        font-size: 30px;
        font-weight: bold;
        color: #28a745;
        position: absolute;
        text-align: center;
        left: 68.5%;
        top: 40%;
      }
      .repayment-result {
        margin-top: 90px;
        font-size: 30px;
        font-weight: bold;
        color: #28a745;
        position: absolute;
        text-align: center;
        left: 68.5%;
        top: 40%;
      }
      .warning {
        font-size: 24px;
        color: #ff0000;
        font-weight: bold;
        margin-top: 20px;
        left: 15.5%;
        top: 75%;
        position: absolute;
      }
      /* Information Hub Page */
      .info-page {
        background-color: rgba(38, 60, 142, 0);
        background: url('Quant_Group 5_FinHome (7).png') no-repeat center center fixed;
        background-size: cover;
        height: 300vh;
        padding: 20px;
        color: white;
      }
      .info-title {
        font-size: 50px;
        font-weight: bold;
        color: white;
        text-align: center;
        margin-bottom: 30px;
      }
      .info-section {
        background-color: rgba(0, 0, 0, 0.5);
        padding: 60px;
        border-radius: 10px;
        margin-bottom: 20px;
      }

     .info-section.collapsed {
        max-height: 50px;
      }
      .info-section.expanded {
        max-height: 10000000px; 
      }
      .info-section h3 {
        margin: -15px 0 0 0;
        font-size: 30px;
        font-weight: bold;
        color: white;
      }
      .info-section p {
        margin: 45px 0 0 0;
        opacity: 0; 
        transform: translateY(-10px); 
        transition: opacity 0.3s ease-out, transform 0.3s ease-out;
      }
      .info-section.expanded p {
        opacity: 1; 
        transform: translateY(0); 
      }
      .info-section ul {
        opacity: 0;
        list-style-type: disc;
        margin: 20px 0 0 20px; 
        padding-left: 20px; 
      }
      .info-section table {
        opacity: 0;
        width: 100%; 
        border-collapse: collapse; 
        margin-top: 20px;
      }
      .info-section.expanded table, .info-section.expanded ul {
        opacity: 1;
        padding: 10px;
        text-align: left;
        border: 1px solid #fff; /* Optional: Add borders for visibility */
        color: white;
      }
      .back-btn {
        position: absolute;
        bottom: 90%;
        right: 5%;
        background-color: yellow;
        color: black;
        font-size: 18px;
        font-weight: bold;
        border: none;
        padding: 10px 20px;
        border-radius: 10px;
        cursor: pointer;
      }
      .back-btn:hover {
        background-color: gold;
      }
    ")),
    tags$script(HTML("
      $(document).on('click', '.info-section', function() {
      $(this).toggleClass('collapsed expanded');
      });
  "))
  ),
  
  uiOutput("page_content")
)

# Define Server
server <- function(input, output, session) {
  page <- reactiveValues(current = "intro")
  
  output$page_content <- renderUI({
    if (page$current == "intro") {
      # Introduction Page
      div(
        class = "intro-page",
        actionButton("start", "Start Now", class = "start-btn")
      )
    } else if (page$current == "menu") {
      # Menu Page
      div(
        class = "menu-page",
        actionButton("btn_house", "", class = "invisible-btn btn-house"),
        actionButton("btn_financial", "", class = "invisible-btn btn-financial"),
        actionButton("btn_mortgage", "", class = "invisible-btn btn-mortgage"),
        actionButton("btn_info", "", class = "invisible-btn btn-info"),
        actionButton("back_to_intro", "Back to Introduction", class = "back-btn")
      )
    } else if (page$current == "house_prediction") {
      # House Price Prediction Page
      div(
        class = "prediction-page",
        h2("House Price Prediction", class = "prediction-title"),
        fluidRow(
          column(4, 
                 div(class = "prediction-input-label", "Area (Square Meters)"), 
                 textInput("area", NULL, placeholder = "Enter area in square meters")
          ),
          column(4, 
                 div(class = "prediction-input-label", "Frontage (Meters)"), 
                 textInput("frontage", NULL, placeholder = "Enter frontage length in meters")
          )
        ),
        fluidRow(
          column(4, 
                 div(class = "prediction-input-label", "Access Road (Meters)"), 
                 textInput("access_road", NULL, placeholder = "Enter access road in meters")
                 
          ),
          column(4, 
                 div(class = "prediction-input-label", "Number of Floors"), 
                 numericInput("floors", NULL, value = 1, min = 1, step = 1)
          )
        ),
        fluidRow(
          column(4, 
                 div(class = "prediction-input-label", "Number of Bedrooms"), 
                 numericInput("bedrooms", NULL, value = 2, min = 0, step = 1)
          ),
          column(4, 
                 div(class = "prediction-input-label", "Number of Bathrooms"), 
                 numericInput("bathrooms", NULL, value = 1, min = 0, step = 1)
          )
        ),
        fluidRow(
          column(4, 
                 div(class = "prediction-input-label", "Province"), 
                 selectInput("province", NULL, choices = c('An Giang', 'Bà Rịa Vũng Tàu', 'Bình Dương', 'Bình Phước', 'Bình Thuận', 'Bình Định', 'Bạc Liêu', 'Bắc Giang', 'Bắc Ninh', 'Bến Tre', 'Cà Mau', 'Cần Thơ', 'Gia Lai', 'Hà Nội', 'Hà Giang', 'Hà Nam', 'Hà Nội', 'Hà Tĩnh', 'Hòa Bình', 'Hưng Yên', 'Hải Dương', 'Hải Phòng', 'Hậu Giang', 'Hồ Chí Minh', 'Khánh Hòa', 'Kiên Giang', 'Kon Tum', 'Long An', 'Lào Cai', 'Lâm Đồng', 'Lạng Sơn', 'Nam Định', 'Nghệ An', 'Ninh Bình', 'Ninh Thuận', 'Phú Thọ', 'Phú Yên', 'Quảng Bình', 'Quảng Nam', 'Quảng Ngãi', 'Quảng Ninh', 'Quảng Trị', 'Sóc Trăng', 'Sơn La', 'Thanh Hóa', 'Thái Bình', 'Thái Nguyên', 'Thừa Thiên Huế', 'Tiền Giang', 'Trà Vinh', 'Tuyên Quang', 'Tây Ninh', 'Vĩnh Long', 'Vĩnh Phúc', 'Yên Bái', 'Điện Biên', 'Đà Nẵng', 'Đắk Lắk', 'Đồng Nai', 'Đồng Tháp', 'Other'))
          ),
          column(4, 
                 div(class = "prediction-input-label", "Project"), 
                 selectInput("project", NULL, choices = c("Yes", "No"))
          )
        ),
        fluidRow(
          column(4, 
                 div(class = "prediction-input-label", "Intended Year Buy"), 
                 numericInput("year", NULL, value = 2025, min = 2024, max = 2060, step = 1)
          )
        ),
        actionButton("predict", "Predict Price", class = "predict-btn"),
        div(textOutput("predicted_price"), class = "prediction-output-price"),
        actionButton("back_to_menu", "Back to Menu", class = "back-btn")
      )
    } else if (page$current == "financial_management") {
      # Financial Management Page
      div(
        tags$head(
          tags$style(HTML("
      body {
        background: url('Quant_Group 5_FinHome (3).png') no-repeat center center fixed;
        background-size: cover;
      }
      .shiny-tab-panel {
        background-color: rgba(255, 255, 255, 0.8); 
        padding: 20px;
        border-radius: 10px; 
      }
      .container-fluid {
        padding: 20px;
      }
      .custom-title {
        text-align: center;
        font-size: 48px;
        font-weight: bold;
        color: white;
        margin-bottom: 20px;
      }
      "))
        ),
        
        class = "body",
        # Page Title
        div(class = "custom-title", "Financial Management"),
        
        # Tabset Panel
        tabsetPanel(
          # Tax Calculation Tab
          tabPanel("Tax Calculation",
                   tags$head(
                     tags$style(HTML("
                 .tax-page {
                   background: url('Quant_Group 5_FinHome (3).png') no-repeat center center fixed;
                   background-size: cover;
                   height: 80vh;
                   padding: 20px;
                 }
                 .tax-title {
                   font-size: 50px;
                   font-weight: bold;
                   color: black;
                   left: 30%;
                   top: 30%;
                   margin-top: 50px;
                 }
                 .tax-input-label {
                   font-size: 24px !important;
                   font-weight: bold !important;
                   margin-bottom: 5px;
                   margin-top: 55px;
                 }
                 .tax-calculate-btn {
                   background-color: #007bff;
                   color: white;
                   font-size: 20px;
                   font-weight: bold;
                   padding: 10px 20px;
                   border: none;
                   border-radius: 5px;
                   cursor: pointer;
                 }
                 .tax-calculate-btn:hover {
                   background-color: #0056b3;
                 }
                 .tax-result {
                   position: relative;
                   top: -675px;
                   left: 1030px;
                   font-size: 25px;
                   font-weight: bold;
                   color: #28a745;
                   text-align: left;
                   margin-left: 10%;
                   white-space: pre-wrap;
                   line-height: 1.5;
                 }
               "))
                   ),
                   div(
                     class = "tax-page",
                     h2("Tax Calculation", class = "tax-title"),
                     
                     fluidRow(
                       column(4, 
                              div(class = "tax-input-label", "Gross Income (VND)"),
                              numericInput("gross_income", NULL, value = 0, min = 0)
                       ),
                       column(4, 
                              div(class = "tax-input-label", "Other Income (Optional, VND)"),
                              numericInput("other_income", NULL, value = 0, min = 0)
                       )
                     ),
                     fluidRow(
                       column(4, 
                              div(class = "tax-input-label", "Number of Dependents"),
                              numericInput("dependents", NULL, value = 0, min = 0, step = 1)
                       ),
                       column(4, 
                              div(class = "tax-input-label", "Deductions (Optional, VND)"),
                              numericInput("deductions", NULL, value = 0, min = 0)
                       )
                     ),
                     fluidRow(
                       column(4, 
                              div(class = "tax-input-label", "Social Insurance"),
                              selectInput("social_insurance", NULL, choices = c("Yes", "No"))
                       ),
                       column(4, 
                              div(class = "tax-input-label", "Medical Insurance"), 
                              selectInput("medical_insurance", NULL, choices = c("Yes", "No"))
                       )
                     ),
                     fluidRow(
                       column(4, 
                              div(class = "tax-input-label", "Unemployed Insurance"),
                              selectInput("unemployed_insurance", NULL, choices = c("Yes", "No"))
                       ),
                       column(4, 
                              div(class = "tax-input-label", "Other insurance"), 
                              numericInput("other_insurance", NULL, value = 0, min = 0)
                       )
                     ),
                     actionButton("calculate", "Calculate", class = "tax-calculate-btn"),
                     div(textOutput("tax_levels"), class = "tax-result"),
                     div(textOutput("net_income"), class = "tax-result"),

                   )
          ),
          
          # Emergency Fund Tab
          tabPanel("Emergency Fund",
                   tags$head(
                     tags$style(HTML("
                 .emergency-page {
                   background: url('Quant_Group 5_FinHome (3).png') no-repeat center center fixed;
                   background-size: cover;
                   height: 80vh;
                   padding: 20px;
                 }
                 .emergency-title {
                   font-size: 50px;
                   font-weight: bold;
                   color: black;
                   left: 30%;
                   top: 30%;
                   margin-top: 50px;
                 }
                 .emergency-input-label {
                   font-size: 24px !important;
                   font-weight: bold !important;
                   margin-bottom: 5px;
                   margin-top: 55px;
                 }
                 .emergency-calculate-btn {
                   background-color: #007bff;
                   color: white;
                   font-size: 20px;
                   font-weight: bold;
                   padding: 10px 20px;
                   border: none;
                   border-radius: 5px;
                   cursor: pointer;
                 }
                 .emergency-calculate-btn:hover {
                   background-color: #0056b3;
                 }
                 .emergency-result {
                   position: relative;
                   top: -475px;
                   left: 1000px;
                   font-size: 25px;
                   font-weight: bold;
                   color: #28a745;
                   text-align: left;
                   margin-left: 10%;
                   white-space: pre-wrap;
                   line-height: 1.5;
                 }
               "))
                   ),
                   div(
                     class = "emergency-page",
                     h2("Calculate Emergency Fund", class = "emergency-title"),
                     
                     fluidRow(
                       column(4, 
                              div(class = "emergency-input-label", "Housing (Rent or Mortgage Payment)"),
                              numericInput("housing", NULL, value = 4000000, min = 0)
                       ),
                       column(4, 
                              div(class = "emergency-input-label", "Utility (Gas, Electricity, Water, etc)"),
                              numericInput("utility", NULL, value = 1000000, min = 0)
                       )
                     ),
                     fluidRow(
                       column(4, 
                              div(class = "emergency-input-label", "Groceries Expense"),
                              numericInput("groceries", NULL, value = 3000000, min = 0, step = 1)
                       ),
                       column(4, 
                              div(class = "emergency-input-label", "Health Expense"),
                              numericInput("health", NULL, value = 500000, min = 0)
                       )
                     ),
                     fluidRow(
                       column(4, 
                              div(class = "emergency-input-label", "Other Expenses"),
                              numericInput("others", NULL, value = 500000, min = 0)
                       )
                     ),
                     actionButton("calculate_emergency", "Calculate Emergency Fund", class = "emergency-calculate-btn"),
                     div(textOutput("emergency_monthly"), class = "emergency-result"),
                     div(textOutput("emergency_fund"), class = "emergency-result"),

                     
                   )
                   
          ),
          
          # Savings Goal Tab
          tabPanel("Savings Goal",
                   tags$head(
                     tags$style(HTML("
                 .savings-page {
                   background: url('Quant_Group 5_FinHome (3).png') no-repeat center center fixed;
                   background-size: cover;
                   height: 80vh;
                   padding: 20px;
                 }
                 .savings-title {
                   font-size: 50px;
                   font-weight: bold;
                   color: black;
                   left: 30%;
                   top: 30%;
                   margin-top: 50px;
                 }
                 .savings-input-label {
                   font-size: 24px !important;
                   font-weight: bold !important;
                   margin-bottom: 5px;
                   margin-top: 55px;
                 }
                 .savings-calculate-btn {
                   background-color: #007bff;
                   color: white;
                   font-size: 20px;
                   font-weight: bold;
                   padding: 10px 20px;
                   border: none;
                   border-radius: 5px;
                   cursor: pointer;
                 }
                 .savings-calculate-btn:hover {
                   background-color: #0056b3;
                 }
                 .savings-result {
                   position: relative;
                   top: -210px;
                   left: 1030px;
                   font-size: 25px;
                   font-weight: bold;
                   color: #28a745;
                   text-align: left;
                   margin-left: 10%;
                   white-space: pre-wrap;
                   line-height: 1.5;
                 }
               "))
                   ),
                   div(
                     class = "savings-page",
                     h2("Time to Reach Savings Goal", class = "savings-title"),
                     
                     fluidRow(
                       column(4, 
                              div(class = "savings-input-label", "Monthly Deposit (VND)"),
                              numericInput("deposit", NULL, value = 1000000, min = 0)
                       ),
                       column(4, 
                              div(class = "savings-input-label", "Desired Savings Goal (VND)"),
                              numericInput("goal", NULL, value = 50000000, min = 0)
                       )
                     ),
                     fluidRow(
                       column(4, 
                              div(class = "savings-input-label", "Annual Growth Rate (%)"),
                              numericInput("growth_rate", NULL, value = 7, min = 0, step = 0.1)
                       ),
                       column(4, 
                              div(class = "savings-input-label", "Initial Savings (Optional, VND)"),
                              numericInput("initial_savings", NULL, value = 0, min = 0)
                       )
                     ),
                     
                     actionButton("calculate_savings", "Calculate Savings Goal", class = "savings-calculate-btn"),
                     div(textOutput("savings_time"), class = "savings-result"),

                   )

          )
        ),
        actionButton("back_to_menu", "Back to Menu", class = "back-btn")
      )

    } else if (page$current == "mortgage_calculator") {
      # Mortgage Calculator Page
      div(
        class = "mortgage-page",
        h2("Mortgage Calculator", class = "mortgage-title"),
        fluidRow(
          column(4, 
                 div(class = "mortgage-input-label", "Net Income (VND)"),
                 numericInput("net_income", NULL, value = 0, min = 0)
          ),
          column(4, 
                 div(class = "mortgage-input-label", "Loan Amount (VND)"),
                 numericInput("loan_amount", NULL, value = 0, min = 0)
          )
        ),
        fluidRow(
          column(4, 
                 div(class = "mortgage-input-label", "Interest Rate (6.8% per year)"),
                 numericInput("interest_rate", NULL, value = 6.8, min = 0, step = 0.01)
          ),
          column(4, 
                 div(class = "mortgage-input-label", "Loan Term (Years, Max 35)"),
                 numericInput("loan_term", NULL, value = 1, min = 1, max = 35, step = 1)
          )
        ),
        fluidRow(
          column(4, 
                 div(class = "mortgage-input-label", "Early Repayment Time (Months)"),
                 sliderInput("early_repayment_time", NULL, min = 0, max = 50, value = 0, step = 1)
          ),
        ),
        
        actionButton("calculate_mortgage", "Calculate", class = "mortgage-calculate-btn"),
        div(textOutput("monthly_payment"), class = "mortgage-result"),
        div(textOutput("early_repayment_fee"), class = "repayment-result"),
        div(textOutput("threshold_warning"), class = "warning"),
        actionButton("back_to_menu", "Back to Menu", class = "back-btn")
        
      )
    } else if (page$current == "information_hub") {
      # Information Hub Page
      div(
        class = "info-page",
        h2("Information Hub", class = "info-title"),
        
        # Understanding Mortgage Interest Rates and Fees
        div(
          class = "info-section collapsed",
          h3("Understanding Mortgage Interest Rates and Fees"),
          p("When choosing a mortgage, consider both the interest rates and the associated fees charged by banks. Below are key insights:"),
          p("Associated Fees:"),
          tags$ul(
            tags$li("Valuation Fee for Collateral"),
            tags$li("Fire Insurance Premium (if applicable)"),
            tags$li("Notarization Fee for Mortgage Agreement"),
            tags$li("Registration Fee for Secured Transactions")
          ),
          p("Interest Rates from Banks:"),
          tags$table(
            class = "table",
            tags$thead(
              tags$tr(
                tags$th("Bank"), tags$th("Interest Rate and Terms")
              )
            ),
            tags$tbody(
              tags$tr(tags$td("Techcombank"), tags$td("Competitive rates with fees: Valuation Fee, Fire Insurance, Notarization Fee, Registration Fee")),
              tags$tr(tags$td("BIDV"), tags$td("5.2%/year for the first 6 months; 6.0%/year fixed for 24 months")),
              tags$tr(tags$td("VietinBank"), tags$td("6.0%/year for 12 months; 6.7%/year for 24 months; 8.2%/year for 36 months")),
              tags$tr(tags$td("Vietcombank"), tags$td("5.5%/year for 6 months (<24M loans); 6.5%/year for 2 years; 8.5%/year for 3 years")),
              tags$tr(tags$td("TPBank"), tags$td("0% fixed for 3 months; 6.6% fixed for 12 months; 7.6% fixed for 36 months")),
              tags$tr(tags$td("ACB"), tags$td("9.5%/year for 5 years; 7.5%/year for 2 years; 7.0%/year for 1 year; penalty-free prepayment up to 100M VND/month"))
            )
          ),
          p("Things to Consider:"),
          tags$ul(
            tags$li("Short-Term vs Long-Term Fixed Rates: Short-term rates may increase after promotional periods."),
            tags$li("Prepayment Policies: Check if penalties apply for early repayment."),
            tags$li("Associated Fees: Account for all third-party fees.")
          )
        ),
        
        # Tax Calculation Information
        div(
          class = "info-section collapsed",
          h3("Understanding Tax Calculations"),
          p("Calculating your Personal Income Tax (PIT) involves understanding your taxable income and applying the appropriate tax rates. Here's a quick guide:"),
          tags$ul(
            tags$li("Personal Income Tax (PIT) = Taxable Income × Tax Rate"),
            tags$li("Taxable Income = Taxable Earnings - Deductions"),
            tags$li("Taxable Earnings = Total Income - Exempt Income")
          ),
          p("Key Deductions include:"),
          tags$ul(
            tags$li("Social Insurance (8% of gross salary)"),
            tags$li("Health Insurance (1.5% of gross salary)"),
            tags$li("Unemployment Insurance (1% of gross salary)"),
            tags$li("Personal Allowance: 11 million VND per month"),
            tags$li("Dependent Allowance: 4.4 million VND per dependent per month"),
            tags$li("Charitable contributions (optional)")
          ),
          p("Tax Brackets and Rates:"),
          tags$table(
            class = "table",
            tags$thead(
              tags$tr(
                tags$th("Bracket"), tags$th("Taxable Income (VND/month)"), tags$th("Tax Rate")
              )
            ),
            tags$tbody(
              tags$tr(tags$td("1"), tags$td("Up to 5 million"), tags$td("5%")),
              tags$tr(tags$td("2"), tags$td("5M to 10M"), tags$td("10%")),
              tags$tr(tags$td("3"), tags$td("10M to 18M"), tags$td("15%")),
              tags$tr(tags$td("4"), tags$td("18M to 32M"), tags$td("20%")),
              tags$tr(tags$td("5"), tags$td("32M to 52M"), tags$td("25%")),
              tags$tr(tags$td("6"), tags$td("52M to 80M"), tags$td("30%")),
              tags$tr(tags$td("7"), tags$td("Over 80M"), tags$td("35%"))
            )
          ),
          p("Example: For a gross salary of 30M VND with 1 dependent:"),
          tags$ul(
            tags$li("Taxable Earnings = 30M - Exempt Income"),
            tags$li("Deductions = 3.15M (Insurance) + 11M (Personal) + 4.4M (Dependent)"),
            tags$li("Taxable Income = 30M - Deductions = 6.45M"),
            tags$li("Tax = 6.45M × 10% = 645,000 VND")
          )
        ),
        
        # Tips for Maintaining a Good Credit Score
        div(
          class = "info-section collapsed",
          h3("Tips and Strategies for Maintaining a Good Credit Score"),
          p("Maintaining a good credit score is essential for securing loans with favorable terms. Here are some strategies:"),
          tags$ul(
            tags$li("Pay bills on time to avoid late payment penalties."),
            tags$li("Maintain a credit utilization ratio below 30%. For example, if your credit limit is 100M VND, try not to use more than 30M VND."),
            tags$li("Avoid closing old credit accounts to preserve your credit history and utilization ratio."),
            tags$li("Request a credit limit increase to reduce your credit utilization ratio if possible."),
            tags$li("Monitor your credit report regularly to dispute any inaccuracies or fraudulent activity.")
          )
        ),
        
        actionButton("back_to_menu", "Back to Menu", class = "back-btn")
      )
    }
    
  })
  
  # Navigation Logic
  observeEvent(input$start, { page$current <- "menu" })
  observeEvent(input$btn_house, { page$current <- "house_prediction" })
  observeEvent(input$btn_financial, { page$current <- "financial_management" })
  observeEvent(input$btn_mortgage, { page$current <- "mortgage_calculator" })
  observeEvent(input$btn_info, { page$current <- "information_hub" })
  observeEvent(input$back_to_intro, { page$current <- "intro" })
  observeEvent(input$back_to_menu, { page$current <- "menu" })
  observeEvent(input$btn_financial, { 
    page$current <- "financial_management"
    page$current_financial <- "tax_calculation"
  })
  observeEvent(input$next_financial, { page$current_financial <- "next_page" })  
  
  observeEvent(input$predict, {
    coefficients <- list(
      Intercept = 2.547e+00,
      Area = 1.376e-02,
      Frontage = 1.111e-02,
      Access_Road = 5.191e-02,
      Floors = 3.953e-01,
      Bedrooms = 1.957e-01,
      Bathrooms = 2.111e-01,
      Project1 = 5.172e-01
    )
    
    province_coefficients <- list(
      "An Giang" = -3.480e+00,
      "Bà Rịa Vũng Tàu" = -2.030e+00,
      "Bắc Giang" = -3.771e+00,
      "Bạc Liêu" = -5.052e+00,
      "Bắc Ninh" = -1.826e+00,
      "Bến Tre" = -4.284e+00,
      "Bình Định" = -2.249e+00,
      "Bình Dương" = -2.767e+00,
      "Bình Phước" = -5.815e+00,
      "Bình Thuận" = -2.701e+00,
      "Cà Mau" = -4.485e+00,
      "Cần Thơ" = -1.478e+00,
      "Đà Nẵng" = -8.669e-01,
      "Đắk Lắk" = -2.866e+00,
      "Điện Biên" = -2.538e+00,
      "Đồng Nai" = -2.671e+00,
      "Đồng Tháp" = -4.577e+00,
      "Gia Lai" = -5.964e+00,
      "Hà Giang" = -2.328e+00,
      "Hà Nam" = -2.657e+00,
      "Hà Nội" = 4.268e-02,
      "Hà Tĩnh" = -4.691e+00,
      "Hải Dương" = -2.683e+00,
      "Hải Phòng" = -2.152e+00,
      "Hậu Giang" = -4.848e+00,
      "Hồ Chí Minh" = -1.479e-01,
      "Hòa Bình" = -4.023e+00,
      "Hưng Yên" = -6.984e-02,
      "Khánh Hòa" = -1.841e+00,
      "Kiên Giang" = -2.628e+00,
      "Kon Tum" = -4.813e+00,
      "Lâm Đồng" = -2.099e+00,
      "Lạng Sơn" = -2.748e+00,
      "Lào Cai" = -2.531e+00,
      "Long An" = -3.823e+00,
      "Nam Định" = -4.030e+00,
      "Nghệ An" = -1.374e+00,
      "Ninh Bình" = 1.163e+00,
      "Ninh Thuận" = -3.381e+00,
      "Phú Thọ" = -2.976e+00,
      "Phú Yên" = -2.716e+00,
      "Quảng Bình" = -1.017e+01,
      "Quảng Nam" = -1.641e+00,
      "Quảng Ngãi" = -2.831e+00,
      "Quảng Ninh" = -1.644e+00,
      "Quảng Trị" = -2.115e+00,
      "Sơn La" = -4.574e+00,
      "Tây Ninh" = -5.158e+00,
      "Thái Bình" = -2.292e+00,
      "Thái Nguyên" = -3.863e+00,
      "Thanh Hóa" = -2.881e+00,
      "Thừa Thiên Huế" = -2.278e+00,
      "Tiền Giang" = -3.656e+00,
      "Trà Vinh" = -4.671e+00,
      "Tuyên Quang" = -3.022e+00,
      "Unknown" = 2.835e-01,
      "Vĩnh Long" = -3.308e+00,
      "Vĩnh Phúc" = -2.521e+00,
      "Yên Bái" = -3.073e+00,
      "Default" = 0
    )
    
    new_data <- list(
      Area = as.numeric(input$area),
      Frontage = as.numeric(input$frontage),
      Access_Road = as.numeric(input$access_road),
      Floors = as.numeric(input$floors),
      Bedrooms = as.numeric(input$bedrooms),
      Bathrooms = as.numeric(input$bathrooms),
      Project = ifelse(input$project == "Yes", coefficients$Project1, 0),
      Province = input$province
    )
    
    predicted_price <- coefficients$Intercept +
      coefficients$Area * new_data$Area +
      coefficients$Frontage * new_data$Frontage +
      coefficients$Access_Road * new_data$Access_Road +
      coefficients$Floors * new_data$Floors +
      coefficients$Bedrooms * new_data$Bedrooms +
      coefficients$Bathrooms * new_data$Bathrooms +
      new_data$Project
    
    province_effect <- province_coefficients[[new_data$Province]] %||% province_coefficients$Default
    predicted_price <- predicted_price + province_effect
    
    inflation_data <- read.csv("data/simplified_predictions.csv")
    
    current_year <- as.numeric(format(Sys.Date(), "%Y"))
    intended_year <- as.numeric(input$year)
    
    relevant_inflation <- inflation_data$Predicted_Inflation[
      inflation_data$Year >= current_year & inflation_data$Year <= intended_year
    ]
    
    inflation_factor <- prod(1 + relevant_inflation / 100, na.rm = TRUE)
    
    adjusted_price <- predicted_price * inflation_factor
    
    output$predicted_price <- renderText({
      if (is.na(adjusted_price) || is.null(adjusted_price)) {
        "Please enter valid inputs."
      } else {
        paste("Predicted Adjusted Price for", intended_year, ": ",
              format(round(adjusted_price, 2), big.mark = ","), "B VND")

      }
    })
  })
  
  
  
  observeEvent(input$calculate, {
    req(!is.na(input$gross_income), 
        !is.na(input$other_income),
        !is.na(input$dependents),
        !is.na(input$deductions),
        !is.na(input$social_insurance),
        !is.na(input$medical_insurance),
        !is.na(input$unemployed_insurance))
    
    gross_income <- ifelse(is.na(input$gross_income), 0, input$gross_income)
    other_income <- ifelse(is.na(input$other_income), 0, input$other_income)
    dependents <- ifelse(is.na(input$dependents), 0, input$dependents)
    deductions <- ifelse(is.na(input$deductions), 0, input$deductions)
    social_insurance <- ifelse(input$social_insurance == "Yes", 0.08 * gross_income, 0)
    medical_insurance <- ifelse(input$medical_insurance == "Yes", 0.015 * gross_income, 0)
    unemployed_insurance <- ifelse(input$unemployed_insurance == "Yes", 0.01 * gross_income, 0)
    other_insurance <- ifelse(is.na(input$other_insurance), 0, input$other_insurance)
    
    total_income <- gross_income + other_income
    deductions_total <- deductions + social_insurance + medical_insurance + unemployed_insurance + other_insurance + (dependents * 4400000) + 11000000
    taxable_income <- max(total_income - deductions_total, 0)
    
    tax_brackets <- c(5000000, 10000000, 18000000, 32000000, 52000000, 80000000)
    tax_rates <- c(0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35)
    total_tax <- 0
    remaining_income <- taxable_income
    tax_levels <- c()
    
    for (i in seq_along(tax_brackets)) {
      if (remaining_income > 0) {
        taxable_at_this_rate <- min(remaining_income, tax_brackets[i])
        tax_for_this_level <- taxable_at_this_rate * tax_rates[i]
        total_tax <- total_tax + tax_for_this_level
        remaining_income <- remaining_income - taxable_at_this_rate
        tax_levels <- c(tax_levels, paste0("Tax Level ", i, ": ", format(round(tax_for_this_level, 0), big.mark = ",", scientific = FALSE), " VND"))
      }
    }
    if (remaining_income > 0) {
      tax_for_this_level <- remaining_income * tax_rates[length(tax_rates)]
      total_tax <- total_tax + tax_for_this_level
      tax_levels <- c(tax_levels, paste0("Tax Level 7: ", format(round(tax_for_this_level, 0), big.mark = ",", scientific = FALSE), " VND"))
    }
    
    net_income <- max(total_income - total_tax - (social_insurance + medical_insurance + unemployed_insurance + other_insurance) - deductions - (dependents * 4400000), 0)
    
    output$tax_levels <- renderText({
      paste(
        paste(tax_levels, collapse = "\n"),  # Display all tax levels
        "____________",
        paste0("Total Tax: ", format(round(total_tax, 0), big.mark = ",", scientific = FALSE), " VND"),
        "",
        paste0("Taxable Income: ", format(round(taxable_income, 0), big.mark = ",", scientific = FALSE), " VND"),
        "",
        paste0("Net Income: ", format(round(net_income, 0), big.mark = ",", scientific = FALSE), " VND"),
        sep = "\n"
      )
    })
  })
  
  # Emergency Fund Logic
  observeEvent(input$calculate_emergency, {
    monthly_expense <- sum(input$housing, input$utility, input$groceries, input$health, input$others)
    emergency_fund <- monthly_expense * 3
    output$emergency_monthly <- renderUI({
      HTML(paste(
        "Monthly Expense:", 
        "<br>", 
        format(round(monthly_expense, 2), big.mark = ",", scientific = FALSE), 
        "VND"
      ))
    })
    output$emergency_monthly <- renderText({
      paste(
        "Monthly Expense:",
        "\n",
        format(round(monthly_expense, 2), big.mark =",", scientific = FALSE),
        "VND"
      )
    })
    output$emergency_fund <- renderText({
      paste(
        "Recommended Emergency Fund:",
        "\n",
        format(round(emergency_fund, 2), big.mark =",", scientific = FALSE),
        "VND"
      )
    })
  })
  
  # Savings Goal Logic
  observeEvent(input$calculate_savings, {
    deposit <- input$deposit
    goal <- input$goal
    growth_rate <- input$growth_rate / 100
    initial_savings <- input$initial_savings
    
    r <- growth_rate / 12
    n_months <- ifelse(initial_savings >= goal, 0, ceiling(12 * log(1 + (goal - initial_savings) * r / deposit) / log(1 + r)))
    
    output$savings_time <- renderText(paste("Time Required to Reach Goal: ", n_months, " months"))
  })
  
  # Mortgage Calculation Logic
  observeEvent(input$calculate_mortgage, {
    loan_amount <- input$loan_amount
    annual_rate <- input$interest_rate / 100
    monthly_rate <- annual_rate / 12
    months <- input$loan_term * 12
    net_income <- input$net_income
    early_repayment_time <- input$early_repayment_time
    
    if (early_repayment_time > 5*12) {
      early_fee_rate <- 0
    } else {
      early_fee_rate <- 1 / 100
    }
    
    if (monthly_rate > 0) {
      monthly_payment <- loan_amount * (monthly_rate * (1 + monthly_rate)^months) / ((1 + monthly_rate)^months - 1)
    } else {
      monthly_payment <- loan_amount / months
    }
    
    if (early_repayment_time > 0 && early_repayment_time < months) {
      outstanding_balance <- loan_amount * ((1 + monthly_rate)^months - (1 + monthly_rate)^early_repayment_time) / ((1 + monthly_rate)^months - 1)
      early_repayment_fee <- outstanding_balance * early_fee_rate
    } else {
      outstanding_balance <- loan_amount
      early_repayment_fee <- 0
    }
    
    threshold <- net_income * 0.28
    
    output$monthly_payment <- renderText({
      paste("Monthly Payment: ", format(round(monthly_payment, 2), big.mark = ","), "VND")
    })
    output$early_repayment_fee <- renderText({
      paste("Early Repayment Fee: ", format(round(early_repayment_fee, 2), big.mark = ","), "VND")
    })
    
    if (monthly_payment > threshold) {
      output$threshold_warning <- renderText({
        "Warning: Monthly payment exceeds 28% of your net income."
      })
    } 
  })
}

# Run the App
shinyApp(ui = ui, server = server)
