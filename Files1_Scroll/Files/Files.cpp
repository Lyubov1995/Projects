// Files.cpp : Определяет точку входа для приложения.
//

#include "framework.h"
#include "Files.h"
#include <commdlg.h>
#include <fstream>
#include <vector>
#include <string>
#include <commctrl.h>
#include <wingdi.h>

const int LineHeight = 16;
TBBUTTON tbb[] = {
{STD_FILENEW, ID_FILE_NEW, TBSTATE_ENABLED, TBSTYLE_BUTTON,0,0,0,0},
{STD_FILEOPEN, ID_FILE_OPEN,TBSTATE_ENABLED, TBSTYLE_BUTTON,0,0,0,0},
{STD_FILESAVE, ID_FILE_SAVE,TBSTATE_ENABLED, TBSTYLE_BUTTON,0,0,0,0}
};


#define MAX_LOADSTRING 100

// Глобальные переменные:
HINSTANCE hInst;                                // текущий экземпляр
WCHAR szTitle[MAX_LOADSTRING];                  // Текст строки заголовка
WCHAR szWindowClass[MAX_LOADSTRING];            // имя класса главного окна

// Отправить объявления функций, включенных в этот модуль кода:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Разместите код здесь.

    // Инициализация глобальных строк
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_FILES, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Выполнить инициализацию приложения:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_FILES));

    MSG msg;

    // Цикл основного сообщения:
    while (GetMessage(&msg, nullptr, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int) msg.wParam;
}



//
//  ФУНКЦИЯ: MyRegisterClass()
//
//  ЦЕЛЬ: Регистрирует класс окна.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW ;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_FILES));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_FILES);
    wcex.lpszClassName  = szWindowClass;
    wcex.hIconSm        = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

//
//   ФУНКЦИЯ: InitInstance(HINSTANCE, int)
//
//   ЦЕЛЬ: Сохраняет маркер экземпляра и создает главное окно
//
//   КОММЕНТАРИИ:
//
//        В этой функции маркер экземпляра сохраняется в глобальной переменной, а также
//        создается и выводится главное окно программы.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   hInst = hInstance; // Сохранить маркер экземпляра в глобальной переменной

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW | WS_VSCROLL | WS_HSCROLL,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, nullptr, hInstance, nullptr);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  ФУНКЦИЯ: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  ЦЕЛЬ: Обрабатывает сообщения в главном окне.
//
//  WM_COMMAND  - обработать меню приложения
//  WM_PAINT    - Отрисовка главного окна
//  WM_DESTROY  - отправить сообщение о выходе и вернуться
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    int wmId;
    PAINTSTRUCT ps;
    HDC hdc;
    static wchar_t  name[256] = _T("");;
    static OPENFILENAME file;
    std::ifstream in;
    std::ofstream out;
    static std::vector<std::string> v;
    std::vector<std::string>::iterator it;
    std::string st;
    int y, k;
    static SIZE size = { 8, 16 }; //Ширина и высота символа
    static int n, length, sx, sy, cx, iVscrollPos, iHscrollPos, COUNT, MAX_WIDTH;
    static HWND hWndToolBar;
    static int size_Toolbar;
    RECT rt;
    static LOGFONT lf;
    static CHOOSEFONT cf;
    static HFONT hfont;
    TEXTMETRIC tm;

    switch (message)
    {
     
    case WM_CREATE:
        file.lStructSize = sizeof(OPENFILENAME);
        file.hInstance = hInst;
        file.lpstrFilter = _T("Text\0*.txt");
        file.lpstrFile = name;
        file.nMaxFile = 256;
        file.lpstrInitialDir = _T(".\\");
        file.lpstrDefExt = _T("txt");
        hWndToolBar = CreateToolbarEx(hWnd, WS_CHILD | WS_VISIBLE | CCS_TOP, 1, 0,
            HINST_COMMCTRL, IDB_STD_SMALL_COLOR, tbb, 3, 0, 0, 0, 0, sizeof(TBBUTTON));
        cf.lStructSize = sizeof(CHOOSEFONT);
        cf.Flags = CF_EFFECTS | CF_INITTOLOGFONTSTRUCT | CF_SCREENFONTS;
        cf.hwndOwner = hWnd;
        cf.lpLogFont = &lf;
        break;
    case WM_SIZE:
        sx = LOWORD(lParam);
        sy = HIWORD(lParam);
        k = n - (sy - size_Toolbar) / size.cy;
        if (k > 0) COUNT = k; else COUNT = iVscrollPos = 0;
        SetScrollRange(hWnd, SB_VERT, 0, COUNT, FALSE);
        SetScrollPos(hWnd, SB_VERT, iVscrollPos, TRUE);
        k = length - sx / size.cx;
        if (k > 0) MAX_WIDTH = k; else MAX_WIDTH = iHscrollPos = 0;
        SetScrollRange(hWnd, SB_HORZ, 0, MAX_WIDTH, FALSE);
        SetScrollPos(hWnd, SB_HORZ, iHscrollPos, TRUE);
        SendMessageW(hWndToolBar, TB_AUTOSIZE, 0, 0);
        GetWindowRect(hWndToolBar, &rt);
        size_Toolbar = rt.bottom - rt.top;
        break;
    case WM_MOUSEWHEEL:
        iVscrollPos -= (short)HIWORD(wParam) / WHEEL_DELTA;
        iVscrollPos = max(0, min(iVscrollPos, COUNT));
        SetScrollPos(hWnd, SB_VERT, iVscrollPos, TRUE);
        InvalidateRect(hWnd, NULL, TRUE);
        break;
    case WM_VSCROLL:
        switch (LOWORD(wParam))
        {
        case SB_LINEUP: iVscrollPos--; break;
        case SB_LINEDOWN: iVscrollPos++; break;
        case SB_PAGEUP: iVscrollPos -= sy / size.cy; break;
        case SB_PAGEDOWN: iVscrollPos += sy / size.cy; break;
        case SB_THUMBPOSITION: iVscrollPos = HIWORD(wParam); break;
        }
        iVscrollPos = max(0, min(iVscrollPos, COUNT));
        if (iVscrollPos != GetScrollPos(hWnd, SB_VERT))
        {
            SetScrollPos(hWnd, SB_VERT, iVscrollPos, TRUE);
            InvalidateRect(hWnd, NULL, TRUE);
        }
        break;
    case WM_HSCROLL:
        switch (LOWORD(wParam))
        {
        case SB_LINEUP: iHscrollPos--; break;
        case SB_LINEDOWN: iHscrollPos++; break;
        case SB_PAGEUP: iHscrollPos -= 8; break;
        case SB_PAGEDOWN: iHscrollPos += 8; break;
        case SB_THUMBPOSITION: iHscrollPos = HIWORD(wParam); break;
        }
        iHscrollPos = max(0, min(iHscrollPos, MAX_WIDTH));
        if (iHscrollPos != GetScrollPos(hWnd, SB_HORZ))
        {
            SetScrollPos(hWnd, SB_HORZ, iHscrollPos, TRUE);
            InvalidateRect(hWnd, NULL, TRUE);
        }
        break;
    case WM_COMMAND:
        {
            wmId = LOWORD(wParam);
            switch (wmId)
            { 
            case ID_FILE_NEW:
                if (!v.empty()) std::vector<std::string>().swap(v);
                n = length = 0;
                SendMessageW(hWnd, WM_SIZE, 0, sy << 16 | sx);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            case ID_FILE_OPEN:
                file.lpstrTitle = _T("Открыть файл для чтения");
                file.Flags = OFN_HIDEREADONLY;
                if (!GetOpenFileName(&file)) return 1;
                in.open(name);
                while (getline(in, st))
                {
                    if (length < st.length()) length = st.length();
                    v.push_back(st);
                }
                in.close();
                n = v.size();
                SendMessageW(hWnd, WM_SIZE, 0, sy << 16 | sx);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            case ID_FILE_SAVE:
                file.lpstrTitle = _T("Открыть файл для записи");
                file.Flags = OFN_NOTESTFILECREATE;
                if (!GetSaveFileName(&file)) return 1;
                out.open(name);
                for (it = v.begin(); it != v.end(); ++it) out << *it << '\n';
                out.close();
                break;
            case 32782:
                if (ChooseFont(&cf))
                {
                    if (hfont) DeleteObject(hfont);
                    hfont = CreateFontIndirect(&lf);
                    hdc = GetDC(hWnd);
                    SelectObject(hdc, hfont);
                    GetTextMetrics(hdc, &tm);
                    size.cx = tm.tmAveCharWidth;
                    size.cy = tm.tmHeight + tm.tmExternalLeading;
                    ReleaseDC(hWnd, hdc);
                    SendMessageW(hWnd, WM_SIZE, 0, sy << 16 | sx);
                    InvalidateRect(hWnd, NULL, TRUE);
                }
                break;
            case IDM_ABOUT:
                DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
                break;
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
        break;
    case WM_PAINT:
        hdc = BeginPaint(hWnd, &ps);
        if (hfont)
        {
            SelectObject(hdc, hfont);
            SetTextColor(hdc, cf.rgbColors);
        }
        for (y = size_Toolbar, it = v.begin() + iVscrollPos;
            it != v.end() && y < sy; ++it, y += size.cy)
            if (iHscrollPos < it->length())
                TabbedTextOutA(hdc, 0, y, it->data() + iHscrollPos,
                    it->length() - iHscrollPos, 0, NULL, 0);
        EndPaint(hWnd, &ps);

        break;
    case WM_DESTROY:
        if (hfont) DeleteObject(hfont);
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Обработчик сообщений для окна "О программе".
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}
