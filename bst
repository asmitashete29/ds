#include <iostream>
using namespace std;

struct Node {
    int data;
    Node *left, *right;
};

Node* createNode(int value) {
    Node* newNode = new Node;
    newNode->data = value;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

Node* insert(Node* root, int value) {
    if (root == NULL)
        return createNode(value);

    if (value < root->data)
        root->left = insert(root->left, value);
    else if (value > root->data)
        root->right = insert(root->right, value);

    return root;
}

Node* findMin(Node* root) {
    while (root != NULL && root->left != NULL)
        root = root->left;
    return root;
}

Node* deleteNode(Node* root, int value) {
    if (root == NULL)
        return root;

    if (value < root->data)
        root->left = deleteNode(root->left, value);
    else if (value > root->data)
        root->right = deleteNode(root->right, value);
    else {
        if (root->left == NULL) {
            Node* temp = root->right;
            delete root;
            return temp;
        }
        else if (root->right == NULL) {
            Node* temp = root->left;
            delete root;
            return temp;
        }

        Node* temp = findMin(root->right);
        root->data = temp->data;
        root->right = deleteNode(root->right, temp->data);
    }

    return root;
}

bool search(Node* root, int value) {
    if (root == NULL)
        return false;

    if (root->data == value)
        return true;

    if (value < root->data)
        return search(root->left, value);

    return search(root->right, value);
}

void inorder(Node* root) {
    if (root != NULL) {
        inorder(root->left);
        cout << root->data << " ";
        inorder(root->right);
    }
}

void preorder(Node* root) {
    if (root != NULL) {
        cout << root->data << " ";
        preorder(root->left);
        preorder(root->right);
    }
}

void postorder(Node* root) {
    if (root != NULL) {
        postorder(root->left);
        postorder(root->right);
        cout << root->data << " ";
    }
}

int main() {
	cout << "Akshada pavbake\n";
    Node* root = NULL;
    int choice, value;

    do {
        cout << "\n\n--- Binary Search Tree Operations ---";
        cout << "\n1. Insert";
        cout << "\n2. Search";
        cout << "\n3. Delete";
        cout << "\n4. Inorder Traversal";
        cout << "\n5. Preorder Traversal";
        cout << "\n6. Postorder Traversal";
        cout << "\n7. Exit";
        cout << "\nEnter your choice: ";
        cin >> choice;

        switch (choice) {
        case 1:
            cout << "Enter value to insert: ";
            cin >> value;
            root = insert(root, value);
            cout << "Value inserted.";
            break;

        case 2:
            cout << "Enter value to search: ";
            cin >> value;
            if (search(root, value))
                cout << "Value found.";
            else
                cout << "Value not found.";
            break;

        case 3:
            cout << "Enter value to delete: ";
            cin >> value;
            if (search(root, value)) {
                root = deleteNode(root, value);
                cout << "Value deleted.";
            } else {
                cout << "Value not found.";
            }
            break;

        case 4:
            cout << "Inorder: ";
            inorder(root);
            break;

        case 5:
            cout << "Preorder: ";
            preorder(root);
            break;

        case 6:
            cout << "Postorder: ";
            postorder(root);
            break;

        case 7:
            cout << "Program terminated.";
            break;

        default:
            cout << "Invalid choice.";
        }
    } while (choice != 7);

    return 0;
}
