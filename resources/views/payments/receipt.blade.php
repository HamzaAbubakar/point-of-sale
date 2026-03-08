<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt #{{ $payment->id }}</title>

    <!-- Thermal Receipt Styles -->
    <style>
        /* Base Reset */
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #f0f0f0;
            color: #000;
            font-size: 12px;
            line-height: 1.4;
        }

        .text-center { text-align: center; }
        .text-right { text-align: right; }
        .text-left { text-align: left; }
        .font-bold { font-weight: bold; }
        .text-uppercase { text-transform: uppercase; }
        .mb-1 { margin-bottom: 4px; }
        .mb-3 { margin-bottom: 12px; }
        .d-flex { display: flex; }
        .justify-between { justify-content: space-between; }

        .receipt-container {
            width: 80mm;
            margin: 20px auto;
            background: #fff;
            padding: 5mm;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .dashed-line {
            border-bottom: 1px dashed #000;
            margin: 10px 0;
        }

        /* Screen-Only Buttons */
        .action-buttons { text-align: center; margin-bottom: 20px; }
        .btn {
            background: #333; color: #fff; border: none; padding: 8px 16px;
            border-radius: 20px; cursor: pointer; text-decoration: none;
            font-size: 12px; display: inline-block; margin: 0 5px;
        }
        .btn:hover { background: #000; }

        @media print {
            @page { margin: 0; size: auto; }
            body { background: #fff; }
            .receipt-container {
                width: 100%;
                margin: 0;
                padding: 2mm;
                box-shadow: none;
            }
            .action-buttons { display: none; }
        }
    </style>

    <script>
        window.onload = function() { window.print(); }
    </script>
</head>
<body>

    <div class="action-buttons">
        <button class="btn" onclick="window.print()">Print Again</button>
        <button class="btn" onclick="window.close()">Close</button>
    </div>

    <div class="receipt-container">
        <div class="header text-center mb-3">
            <h2 class="font-bold text-uppercase">POS SHOP</h2>
            <p>PAYMENT RECEIPT</p>
        </div>

        <div class="dashed-line"></div>

        <div class="d-flex justify-between mb-1">
            <span>Date:</span>
            <span>{{ $payment->date->format('d/m/Y H:i') }}</span>
        </div>
        <div class="d-flex justify-between mb-1">
            <span>Ref:</span>
            <span>#{{ $payment->reference_code }}</span>
        </div>
        <div class="d-flex justify-between mb-1">
            <span>Customer:</span>
            <span class="font-bold">{{ substr($payment->customer->name, 0, 15) }}</span>
        </div>

        <div class="dashed-line"></div>

        <div class="d-flex justify-between mb-1 font-bold" style="font-size: 14px;">
            <span>AMOUNT PAID</span>
            <span>{{ number_format($payment->amount, 0, ',', '.') }}</span>
        </div>

        <div class="d-flex justify-between mb-1">
            <span>Method:</span>
            <span>{{ $payment->payment_method }}</span>
        </div>
        
        @if($payment->note)
        <div class="mt-2">
            <p class="font-bold">Note:</p>
            <p>{{ $payment->note }}</p>
        </div>
        @endif

        <div class="dashed-line"></div>

        <div class="footer text-center">
            <p class="mb-1">*** THANK YOU ***</p>
        </div>
    </div>
</body>
</html>
