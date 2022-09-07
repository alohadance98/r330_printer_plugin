package com.example.r330_printer_plugin;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.IBinder;
import android.util.Base64;
import android.util.Log;

import recieptservice.com.recieptservice.PrinterInterface;

public class R330PrinterMethod {
    private static final String TAG = "R330";
    PrinterInterface mAidl;
    private Context _context;

    public R330PrinterMethod(Context context) {
        this._context = context;
    }

    public int printImage(String image) {
        int resultValue = -1;
        byte[] decodedString = Base64.decode(image, Base64.DEFAULT);
        Bitmap mBitmap = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
        try {
            mAidl.printBitmap(mBitmap);
            resultValue = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultValue;
    }

    public int printBlankLine(int line) {
        int resultValue = -1;
        try {
            mAidl.nextLine(line);
            resultValue = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultValue;
    }

    public ServiceConnection connectService = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder service) {
            mAidl = PrinterInterface.Stub.asInterface(service);
            Log.i(TAG, "***** connectService:");
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            mAidl = null;
        }
    };

    public void bindPrinterService() {
        Intent intent = new Intent();
        intent.setPackage("recieptservice.com.recieptservice");
        intent.setAction("recieptservice.com.recieptservice.service.PrinterService");
        _context.bindService(intent, connectService, Context.BIND_AUTO_CREATE);
    }

    public void unbindPrinterService() {
        _context.unbindService(connectService);
    }
}
